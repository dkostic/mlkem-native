/*
 * Copyright (c) The mlkem-native project authors
 * SPDX-License-Identifier: Apache-2.0 OR ISC OR MIT
 */

/*
 * Lazy reduction basemul for x86_64/AVX2 -- proof of concept.
 *
 * Within each polynomial product (a+bX)(c+dX), we skip the Montgomery
 * reduction on individual 16x16 multiplications and instead accumulate
 * pairs of raw 32-bit products before reducing:
 *   r_32 = a*c + b*dz    (true 32-bit sum)
 *   s_32 = a*d + b*c     (true 32-bit sum)
 * This gives 2 Montgomery reductions per schoolbook block instead of 4.
 *
 * 32-bit accumulation uses vpunpcklwd/vpunpckhwd to interleave lo16/hi16
 * of products into 32-bit lanes, then vpaddd to accumulate.
 *
 * Montgomery reduction on interleaved 32-bit data (key trick):
 *   Given r_32 as 8 x int32 in a YMM, viewed as 16 x int16:
 *     even lanes = lo16, odd lanes = hi16 of each 32-bit value.
 *   1. twist = vpmullw(r_32, qinv)     -- even lanes: lo16(lo*qinv)
 *   2. corr  = vpmulhw(twist, q)       -- even lanes: hi16(twist*q)
 *   3. vpslld $16, corr                -- shift correction to odd lanes
 *   4. vpsubd(r_32, shifted_corr)      -- odd lanes: hi16 - correction
 *   5. vpsrad $16                      -- extract result from odd lanes
 *
 * Each block is processed in two halves (low/high 8 coefficients)
 * since interleaving doubles the lane width.
 */

#include "consts.h"

#define _q %ymm0
#define _qx %xmm0
#define _qinv %ymm1
#define _qinvx %xmm1
#define _a %ymm2
#define _b %ymm3
#define _c %ymm4
#define _d %ymm5
#define _dz %ymm6
#define _ac_lo  %ymm7
#define _ac_hi  %ymm8
#define _bdz_lo %ymm9
#define _bdz_hi %ymm10
#define _ad_lo  %ymm11
#define _ad_hi  %ymm12
#define _bc_lo  %ymm13
#define _bc_hi  %ymm14
#define _tmp    %ymm15

.macro mont_reduce_interleaved reg, scratch
  vpmullw \reg, _qinv, \scratch
  vpmulhw \scratch, _q, \scratch
  vpslld $16, \scratch, \scratch
  vpsubd \scratch, \reg, \reg
  vpsrad $16, \reg, \reg
.endm

.macro lazy_schoolbook iter, k
/* Load inputs */
vmovdqa (256*\k + 32*\iter +  0)*2(%rsi), _a
vmovdqa (256*\k + 32*\iter + 16)*2(%rsi), _b
vmovdqa (256*\k + 32*\iter +  0)*2(%rdx), _c
vmovdqa (256*\k + 32*\iter + 16)*2(%rdx), _d
vmovdqa (128*\k + 16*\iter)*2(%rcx), _dz

/* Compute lo16/hi16 of all four 16x16 products */
vpmullw _a, _c,  _ac_lo
vpmulhw _a, _c,  _ac_hi
vpmullw _b, _dz, _bdz_lo
vpmulhw _b, _dz, _bdz_hi
vpmullw _a, _d,  _ad_lo
vpmulhw _a, _d,  _ad_hi
vpmullw _b, _c,  _bc_lo
vpmulhw _b, _c,  _bc_hi

/* === Low half (coefficients 0-7) === */

vpunpcklwd _ac_hi, _ac_lo, _a
vpunpcklwd _bdz_hi, _bdz_lo, _b

.if \iter & 1
vpsubd _b, _a, _a
.else
vpaddd _b, _a, _a
.endif

mont_reduce_interleaved _a, _tmp

vpunpcklwd _ad_hi, _ad_lo, _b
vpunpcklwd _bc_hi, _bc_lo, _c
vpaddd _c, _b, _b

mont_reduce_interleaved _b, _tmp

/* Pack r,s from 8x32 to 16x16: [r0-3,s0-3,r4-7,s4-7] -> [r0-7,s0-7] */
vpackssdw _b, _a, _a
vpermq $0xD8, _a, _a

vmovdqu _a, -32(%rsp)

/* === High half (coefficients 8-15) === */

vpunpckhwd _ac_hi, _ac_lo, _a
vpunpckhwd _bdz_hi, _bdz_lo, _b

.if \iter & 1
vpsubd _b, _a, _a
.else
vpaddd _b, _a, _a
.endif

mont_reduce_interleaved _a, _tmp

vpunpckhwd _ad_hi, _ad_lo, _b
vpunpckhwd _bc_hi, _bc_lo, _c
vpaddd _c, _b, _b

mont_reduce_interleaved _b, _tmp

vpackssdw _b, _a, _a
vpermq $0xD8, _a, _a

/* Combine halves: stack=[r_lo,s_lo], _a=[r_hi,s_hi] */
vmovdqu -32(%rsp), _b

vperm2i128 $0x20, _a, _b, _c
vpermq $0xD8, _c, _c                /* r[0..15] */
vperm2i128 $0x31, _a, _b, _d
vpermq $0xD8, _d, _d                /* s[0..15] */

/* Accumulate across polynomials */
.if \k > 0
vpaddw (32*\iter +  0)*2(%rdi), _c, _c
vpaddw (32*\iter + 16)*2(%rdi), _d, _d
.endif

vmovdqa _c, (32*\iter +  0)*2(%rdi)
vmovdqa _d, (32*\iter + 16)*2(%rdi)

/* Bounds:
 * abs(a,b) < 2^12, abs(c,d,dz) <= 2^15.
 * 32-bit product: < 2^27. Sum of two: < 2^28.
 * After Montgomery reduction: <= 4096 + 1665 = 5761.
 * k=4 accumulation: 4 * 5761 = 23044 < 2^15.
 */
.endm

.macro lazy_poly_basemul k
lazy_schoolbook 0, \k
lazy_schoolbook 1, \k
lazy_schoolbook 2, \k
lazy_schoolbook 3, \k
lazy_schoolbook 4, \k
lazy_schoolbook 5, \k
lazy_schoolbook 6, \k
lazy_schoolbook 7, \k
.endm

.macro lazy_polyvec_basemul k
  movl $0x0D010D01, %eax
  vmovd %eax, _qx
  vpbroadcastd _qx, _q

  movl $0xF301F301, %eax
  vmovd %eax, _qinvx
  vpbroadcastd _qinvx, _qinv

  .if \k > 0
    lazy_poly_basemul 0
  .endif
  .if \k > 1
    lazy_poly_basemul 1
  .endif
  .if \k > 2
    lazy_poly_basemul 2
  .endif
  .if \k > 3
    lazy_poly_basemul 3
  .endif
.endm

#undef _q
#undef _qx
#undef _qinv
#undef _qinvx
#undef _a
#undef _b
#undef _c
#undef _d
#undef _dz
#undef _ac_lo
#undef _ac_hi
#undef _bdz_lo
#undef _bdz_hi
#undef _ad_lo
#undef _ad_hi
#undef _bc_lo
#undef _bc_hi
#undef _tmp
