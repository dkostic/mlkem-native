/*
 * Copyright (c) The mlkem-native project authors
 * SPDX-License-Identifier: Apache-2.0 OR ISC OR MIT
 */

#include "../../../common.h"
#if defined(MLK_ARITH_BACKEND_X86_64_DEFAULT) && \
    !defined(MLK_CONFIG_MULTILEVEL_NO_SHARED) && \
    (defined(MLK_CONFIG_MULTILEVEL_WITH_SHARED) || MLKEM_K == 4)

/*
 * WARNING: This file is auto-derived from the mlkem-native source file
 *   dev/x86_64/src/polyvec_basemul_acc_montgomery_cached_asm_k4.S using scripts/simpasm. Do not modify it directly.
 */

#if defined(__ELF__)
.section .note.GNU-stack,"",@progbits
#endif

.text
.balign 4
.global MLK_ASM_NAMESPACE(polyvec_basemul_acc_montgomery_cached_asm_k4)
MLK_ASM_FN_SYMBOL(polyvec_basemul_acc_montgomery_cached_asm_k4)

        .cfi_startproc
        movl $0xd010d01, %eax        # imm = 0xD010D01
        vmovd %eax, %xmm0
        vpbroadcastd %xmm0, %ymm0
        movl $0xf301f301, %eax       # imm = 0xF301F301
        vmovd %eax, %xmm1
        vpbroadcastd %xmm1, %ymm1
        vmovdqa (%rsi), %ymm2
        vmovdqa 0x20(%rsi), %ymm3
        vmovdqa (%rdx), %ymm4
        vmovdqa 0x20(%rdx), %ymm5
        vmovdqa (%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vmovdqa %ymm4, (%rdi)
        vmovdqa %ymm5, 0x20(%rdi)
        vmovdqa 0x40(%rsi), %ymm2
        vmovdqa 0x60(%rsi), %ymm3
        vmovdqa 0x40(%rdx), %ymm4
        vmovdqa 0x60(%rdx), %ymm5
        vmovdqa 0x20(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vmovdqa %ymm4, 0x40(%rdi)
        vmovdqa %ymm5, 0x60(%rdi)
        vmovdqa 0x80(%rsi), %ymm2
        vmovdqa 0xa0(%rsi), %ymm3
        vmovdqa 0x80(%rdx), %ymm4
        vmovdqa 0xa0(%rdx), %ymm5
        vmovdqa 0x40(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vmovdqa %ymm4, 0x80(%rdi)
        vmovdqa %ymm5, 0xa0(%rdi)
        vmovdqa 0xc0(%rsi), %ymm2
        vmovdqa 0xe0(%rsi), %ymm3
        vmovdqa 0xc0(%rdx), %ymm4
        vmovdqa 0xe0(%rdx), %ymm5
        vmovdqa 0x60(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vmovdqa %ymm4, 0xc0(%rdi)
        vmovdqa %ymm5, 0xe0(%rdi)
        vmovdqa 0x100(%rsi), %ymm2
        vmovdqa 0x120(%rsi), %ymm3
        vmovdqa 0x100(%rdx), %ymm4
        vmovdqa 0x120(%rdx), %ymm5
        vmovdqa 0x80(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vmovdqa %ymm4, 0x100(%rdi)
        vmovdqa %ymm5, 0x120(%rdi)
        vmovdqa 0x140(%rsi), %ymm2
        vmovdqa 0x160(%rsi), %ymm3
        vmovdqa 0x140(%rdx), %ymm4
        vmovdqa 0x160(%rdx), %ymm5
        vmovdqa 0xa0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vmovdqa %ymm4, 0x140(%rdi)
        vmovdqa %ymm5, 0x160(%rdi)
        vmovdqa 0x180(%rsi), %ymm2
        vmovdqa 0x1a0(%rsi), %ymm3
        vmovdqa 0x180(%rdx), %ymm4
        vmovdqa 0x1a0(%rdx), %ymm5
        vmovdqa 0xc0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vmovdqa %ymm4, 0x180(%rdi)
        vmovdqa %ymm5, 0x1a0(%rdi)
        vmovdqa 0x1c0(%rsi), %ymm2
        vmovdqa 0x1e0(%rsi), %ymm3
        vmovdqa 0x1c0(%rdx), %ymm4
        vmovdqa 0x1e0(%rdx), %ymm5
        vmovdqa 0xe0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vmovdqa %ymm4, 0x1c0(%rdi)
        vmovdqa %ymm5, 0x1e0(%rdi)
        vmovdqa 0x200(%rsi), %ymm2
        vmovdqa 0x220(%rsi), %ymm3
        vmovdqa 0x200(%rdx), %ymm4
        vmovdqa 0x220(%rdx), %ymm5
        vmovdqa 0x100(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw (%rdi), %ymm4, %ymm4
        vpaddw 0x20(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, (%rdi)
        vmovdqa %ymm5, 0x20(%rdi)
        vmovdqa 0x240(%rsi), %ymm2
        vmovdqa 0x260(%rsi), %ymm3
        vmovdqa 0x240(%rdx), %ymm4
        vmovdqa 0x260(%rdx), %ymm5
        vmovdqa 0x120(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x40(%rdi), %ymm4, %ymm4
        vpaddw 0x60(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x40(%rdi)
        vmovdqa %ymm5, 0x60(%rdi)
        vmovdqa 0x280(%rsi), %ymm2
        vmovdqa 0x2a0(%rsi), %ymm3
        vmovdqa 0x280(%rdx), %ymm4
        vmovdqa 0x2a0(%rdx), %ymm5
        vmovdqa 0x140(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x80(%rdi), %ymm4, %ymm4
        vpaddw 0xa0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x80(%rdi)
        vmovdqa %ymm5, 0xa0(%rdi)
        vmovdqa 0x2c0(%rsi), %ymm2
        vmovdqa 0x2e0(%rsi), %ymm3
        vmovdqa 0x2c0(%rdx), %ymm4
        vmovdqa 0x2e0(%rdx), %ymm5
        vmovdqa 0x160(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0xc0(%rdi), %ymm4, %ymm4
        vpaddw 0xe0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0xc0(%rdi)
        vmovdqa %ymm5, 0xe0(%rdi)
        vmovdqa 0x300(%rsi), %ymm2
        vmovdqa 0x320(%rsi), %ymm3
        vmovdqa 0x300(%rdx), %ymm4
        vmovdqa 0x320(%rdx), %ymm5
        vmovdqa 0x180(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x100(%rdi), %ymm4, %ymm4
        vpaddw 0x120(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x100(%rdi)
        vmovdqa %ymm5, 0x120(%rdi)
        vmovdqa 0x340(%rsi), %ymm2
        vmovdqa 0x360(%rsi), %ymm3
        vmovdqa 0x340(%rdx), %ymm4
        vmovdqa 0x360(%rdx), %ymm5
        vmovdqa 0x1a0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x140(%rdi), %ymm4, %ymm4
        vpaddw 0x160(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x140(%rdi)
        vmovdqa %ymm5, 0x160(%rdi)
        vmovdqa 0x380(%rsi), %ymm2
        vmovdqa 0x3a0(%rsi), %ymm3
        vmovdqa 0x380(%rdx), %ymm4
        vmovdqa 0x3a0(%rdx), %ymm5
        vmovdqa 0x1c0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x180(%rdi), %ymm4, %ymm4
        vpaddw 0x1a0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x180(%rdi)
        vmovdqa %ymm5, 0x1a0(%rdi)
        vmovdqa 0x3c0(%rsi), %ymm2
        vmovdqa 0x3e0(%rsi), %ymm3
        vmovdqa 0x3c0(%rdx), %ymm4
        vmovdqa 0x3e0(%rdx), %ymm5
        vmovdqa 0x1e0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x1c0(%rdi), %ymm4, %ymm4
        vpaddw 0x1e0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x1c0(%rdi)
        vmovdqa %ymm5, 0x1e0(%rdi)
        vmovdqa 0x400(%rsi), %ymm2
        vmovdqa 0x420(%rsi), %ymm3
        vmovdqa 0x400(%rdx), %ymm4
        vmovdqa 0x420(%rdx), %ymm5
        vmovdqa 0x200(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw (%rdi), %ymm4, %ymm4
        vpaddw 0x20(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, (%rdi)
        vmovdqa %ymm5, 0x20(%rdi)
        vmovdqa 0x440(%rsi), %ymm2
        vmovdqa 0x460(%rsi), %ymm3
        vmovdqa 0x440(%rdx), %ymm4
        vmovdqa 0x460(%rdx), %ymm5
        vmovdqa 0x220(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x40(%rdi), %ymm4, %ymm4
        vpaddw 0x60(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x40(%rdi)
        vmovdqa %ymm5, 0x60(%rdi)
        vmovdqa 0x480(%rsi), %ymm2
        vmovdqa 0x4a0(%rsi), %ymm3
        vmovdqa 0x480(%rdx), %ymm4
        vmovdqa 0x4a0(%rdx), %ymm5
        vmovdqa 0x240(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x80(%rdi), %ymm4, %ymm4
        vpaddw 0xa0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x80(%rdi)
        vmovdqa %ymm5, 0xa0(%rdi)
        vmovdqa 0x4c0(%rsi), %ymm2
        vmovdqa 0x4e0(%rsi), %ymm3
        vmovdqa 0x4c0(%rdx), %ymm4
        vmovdqa 0x4e0(%rdx), %ymm5
        vmovdqa 0x260(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0xc0(%rdi), %ymm4, %ymm4
        vpaddw 0xe0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0xc0(%rdi)
        vmovdqa %ymm5, 0xe0(%rdi)
        vmovdqa 0x500(%rsi), %ymm2
        vmovdqa 0x520(%rsi), %ymm3
        vmovdqa 0x500(%rdx), %ymm4
        vmovdqa 0x520(%rdx), %ymm5
        vmovdqa 0x280(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x100(%rdi), %ymm4, %ymm4
        vpaddw 0x120(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x100(%rdi)
        vmovdqa %ymm5, 0x120(%rdi)
        vmovdqa 0x540(%rsi), %ymm2
        vmovdqa 0x560(%rsi), %ymm3
        vmovdqa 0x540(%rdx), %ymm4
        vmovdqa 0x560(%rdx), %ymm5
        vmovdqa 0x2a0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x140(%rdi), %ymm4, %ymm4
        vpaddw 0x160(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x140(%rdi)
        vmovdqa %ymm5, 0x160(%rdi)
        vmovdqa 0x580(%rsi), %ymm2
        vmovdqa 0x5a0(%rsi), %ymm3
        vmovdqa 0x580(%rdx), %ymm4
        vmovdqa 0x5a0(%rdx), %ymm5
        vmovdqa 0x2c0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x180(%rdi), %ymm4, %ymm4
        vpaddw 0x1a0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x180(%rdi)
        vmovdqa %ymm5, 0x1a0(%rdi)
        vmovdqa 0x5c0(%rsi), %ymm2
        vmovdqa 0x5e0(%rsi), %ymm3
        vmovdqa 0x5c0(%rdx), %ymm4
        vmovdqa 0x5e0(%rdx), %ymm5
        vmovdqa 0x2e0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x1c0(%rdi), %ymm4, %ymm4
        vpaddw 0x1e0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x1c0(%rdi)
        vmovdqa %ymm5, 0x1e0(%rdi)
        vmovdqa 0x600(%rsi), %ymm2
        vmovdqa 0x620(%rsi), %ymm3
        vmovdqa 0x600(%rdx), %ymm4
        vmovdqa 0x620(%rdx), %ymm5
        vmovdqa 0x300(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw (%rdi), %ymm4, %ymm4
        vpaddw 0x20(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, (%rdi)
        vmovdqa %ymm5, 0x20(%rdi)
        vmovdqa 0x640(%rsi), %ymm2
        vmovdqa 0x660(%rsi), %ymm3
        vmovdqa 0x640(%rdx), %ymm4
        vmovdqa 0x660(%rdx), %ymm5
        vmovdqa 0x320(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x40(%rdi), %ymm4, %ymm4
        vpaddw 0x60(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x40(%rdi)
        vmovdqa %ymm5, 0x60(%rdi)
        vmovdqa 0x680(%rsi), %ymm2
        vmovdqa 0x6a0(%rsi), %ymm3
        vmovdqa 0x680(%rdx), %ymm4
        vmovdqa 0x6a0(%rdx), %ymm5
        vmovdqa 0x340(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x80(%rdi), %ymm4, %ymm4
        vpaddw 0xa0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x80(%rdi)
        vmovdqa %ymm5, 0xa0(%rdi)
        vmovdqa 0x6c0(%rsi), %ymm2
        vmovdqa 0x6e0(%rsi), %ymm3
        vmovdqa 0x6c0(%rdx), %ymm4
        vmovdqa 0x6e0(%rdx), %ymm5
        vmovdqa 0x360(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0xc0(%rdi), %ymm4, %ymm4
        vpaddw 0xe0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0xc0(%rdi)
        vmovdqa %ymm5, 0xe0(%rdi)
        vmovdqa 0x700(%rsi), %ymm2
        vmovdqa 0x720(%rsi), %ymm3
        vmovdqa 0x700(%rdx), %ymm4
        vmovdqa 0x720(%rdx), %ymm5
        vmovdqa 0x380(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x100(%rdi), %ymm4, %ymm4
        vpaddw 0x120(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x100(%rdi)
        vmovdqa %ymm5, 0x120(%rdi)
        vmovdqa 0x740(%rsi), %ymm2
        vmovdqa 0x760(%rsi), %ymm3
        vmovdqa 0x740(%rdx), %ymm4
        vmovdqa 0x760(%rdx), %ymm5
        vmovdqa 0x3a0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x140(%rdi), %ymm4, %ymm4
        vpaddw 0x160(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x140(%rdi)
        vmovdqa %ymm5, 0x160(%rdi)
        vmovdqa 0x780(%rsi), %ymm2
        vmovdqa 0x7a0(%rsi), %ymm3
        vmovdqa 0x780(%rdx), %ymm4
        vmovdqa 0x7a0(%rdx), %ymm5
        vmovdqa 0x3c0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpaddd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x180(%rdi), %ymm4, %ymm4
        vpaddw 0x1a0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x180(%rdi)
        vmovdqa %ymm5, 0x1a0(%rdi)
        vmovdqa 0x7c0(%rsi), %ymm2
        vmovdqa 0x7e0(%rsi), %ymm3
        vmovdqa 0x7c0(%rdx), %ymm4
        vmovdqa 0x7e0(%rdx), %ymm5
        vmovdqa 0x3e0(%rcx), %ymm6
        vpmullw %ymm2, %ymm4, %ymm7
        vpmulhw %ymm2, %ymm4, %ymm8
        vpmullw %ymm3, %ymm6, %ymm9
        vpmulhw %ymm3, %ymm6, %ymm10
        vpmullw %ymm2, %ymm5, %ymm11
        vpmulhw %ymm2, %ymm5, %ymm12
        vpmullw %ymm3, %ymm4, %ymm13
        vpmulhw %ymm3, %ymm4, %ymm14
        vpunpcklwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[8],ymm8[8],ymm7[9],ymm8[9],ymm7[10],ymm8[10],ymm7[11],ymm8[11]
        vpunpcklwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[8],ymm10[8],ymm9[9],ymm10[9],ymm9[10],ymm10[10],ymm9[11],ymm10[11]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpcklwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[8],ymm12[8],ymm11[9],ymm12[9],ymm11[10],ymm12[10],ymm11[11],ymm12[11]
        vpunpcklwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[8],ymm14[8],ymm13[9],ymm14[9],ymm13[10],ymm14[10],ymm13[11],ymm14[11]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm2, %ymm6
        vpunpckhwd %ymm8, %ymm7, %ymm2 # ymm2 = ymm7[4],ymm8[4],ymm7[5],ymm8[5],ymm7[6],ymm8[6],ymm7[7],ymm8[7],ymm7[12],ymm8[12],ymm7[13],ymm8[13],ymm7[14],ymm8[14],ymm7[15],ymm8[15]
        vpunpckhwd %ymm10, %ymm9, %ymm3 # ymm3 = ymm9[4],ymm10[4],ymm9[5],ymm10[5],ymm9[6],ymm10[6],ymm9[7],ymm10[7],ymm9[12],ymm10[12],ymm9[13],ymm10[13],ymm9[14],ymm10[14],ymm9[15],ymm10[15]
        vpsubd %ymm3, %ymm2, %ymm2
        vpmullw %ymm2, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm2, %ymm2
        vpsrad $0x10, %ymm2, %ymm2
        vpunpckhwd %ymm12, %ymm11, %ymm3 # ymm3 = ymm11[4],ymm12[4],ymm11[5],ymm12[5],ymm11[6],ymm12[6],ymm11[7],ymm12[7],ymm11[12],ymm12[12],ymm11[13],ymm12[13],ymm11[14],ymm12[14],ymm11[15],ymm12[15]
        vpunpckhwd %ymm14, %ymm13, %ymm4 # ymm4 = ymm13[4],ymm14[4],ymm13[5],ymm14[5],ymm13[6],ymm14[6],ymm13[7],ymm14[7],ymm13[12],ymm14[12],ymm13[13],ymm14[13],ymm13[14],ymm14[14],ymm13[15],ymm14[15]
        vpaddd %ymm4, %ymm3, %ymm3
        vpmullw %ymm3, %ymm1, %ymm15
        vpmulhw %ymm15, %ymm0, %ymm15
        vpslld $0x10, %ymm15, %ymm15
        vpsubd %ymm15, %ymm3, %ymm3
        vpsrad $0x10, %ymm3, %ymm3
        vpackssdw %ymm3, %ymm2, %ymm2
        vpermq $0xd8, %ymm2, %ymm2     # ymm2 = ymm2[0,2,1,3]
        vmovdqa %ymm6, %ymm3
        vperm2i128 $0x20, %ymm2, %ymm3, %ymm4 # ymm4 = ymm3[0,1],ymm2[0,1]
        vpermq $0xd8, %ymm4, %ymm4     # ymm4 = ymm4[0,2,1,3]
        vperm2i128 $0x31, %ymm2, %ymm3, %ymm5 # ymm5 = ymm3[2,3],ymm2[2,3]
        vpermq $0xd8, %ymm5, %ymm5     # ymm5 = ymm5[0,2,1,3]
        vpaddw 0x1c0(%rdi), %ymm4, %ymm4
        vpaddw 0x1e0(%rdi), %ymm5, %ymm5
        vmovdqa %ymm4, 0x1c0(%rdi)
        vmovdqa %ymm5, 0x1e0(%rdi)
        retq
        .cfi_endproc

MLK_ASM_FN_SIZE(polyvec_basemul_acc_montgomery_cached_asm_k4)

#endif /* MLK_ARITH_BACKEND_X86_64_DEFAULT && !MLK_CONFIG_MULTILEVEL_NO_SHARED \
          && (MLK_CONFIG_MULTILEVEL_WITH_SHARED || MLKEM_K == 4) */
