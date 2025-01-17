/*
 * Copyright (c) 2024 The mlkem-native project authors
 * SPDX-License-Identifier: Apache-2.0
 */
#ifndef MLKEM_AARCH64_NATIVE_H
#define MLKEM_AARCH64_NATIVE_H

#include <stdint.h>
#include "config.h"
#include "params.h"

#ifdef MLKEM_USE_NATIVE_AARCH64

#define aarch64_ntt_zetas_layer01234 \
  MLKEM_NAMESPACE(aarch64_ntt_zetas_layer01234)
#define aarch64_ntt_zetas_layer56 MLKEM_NAMESPACE(aarch64_ntt_zetas_layer56)
#define aarch64_invntt_zetas_layer01234 \
  MLKEM_NAMESPACE(aarch64_invntt_zetas_layer01234)
#define aarch64_invntt_zetas_layer56 \
  MLKEM_NAMESPACE(aarch64_invntt_zetas_layer56)
#define aarch64_zetas_mulcache_native \
  MLKEM_NAMESPACE(aarch64_zetas_mulcache_native)
#define aarch64_zetas_mulcache_twisted_native \
  MLKEM_NAMESPACE(aarch64_zetas_mulcache_twisted_native)

extern const int16_t aarch64_ntt_zetas_layer01234[];
extern const int16_t aarch64_ntt_zetas_layer56[];
extern const int16_t aarch64_invntt_zetas_layer01234[];
extern const int16_t aarch64_invntt_zetas_layer56[];
extern const int16_t aarch64_zetas_mulcache_native[];
extern const int16_t aarch64_zetas_mulcache_twisted_native[];

#define ntt_asm_clean MLKEM_NAMESPACE(ntt_asm_clean)
void ntt_asm_clean(int16_t *, const int16_t *, const int16_t *);

#define ntt_asm_opt MLKEM_NAMESPACE(ntt_asm_opt)
void ntt_asm_opt(int16_t *, const int16_t *, const int16_t *);

#define intt_asm_clean MLKEM_NAMESPACE(intt_asm_clean)
void intt_asm_clean(int16_t *, const int16_t *, const int16_t *);

#define intt_asm_opt MLKEM_NAMESPACE(intt_asm_opt)
void intt_asm_opt(int16_t *, const int16_t *, const int16_t *);

#define rej_uniform_asm_clean MLKEM_NAMESPACE(rej_uniform_asm_clean)
unsigned int rej_uniform_asm_clean(int16_t *r, const uint8_t *buf,
                                   unsigned int buflen);

#define poly_reduce_asm_clean MLKEM_NAMESPACE(poly_reduce_asm_clean)
void poly_reduce_asm_clean(int16_t *);

#define poly_reduce_asm_opt MLKEM_NAMESPACE(poly_reduce_asm_opt)
void poly_reduce_asm_opt(int16_t *);

#define poly_tomont_asm_clean MLKEM_NAMESPACE(poly_tomont_asm_clean)
void poly_tomont_asm_clean(int16_t *);

#define poly_tomont_asm_opt MLKEM_NAMESPACE(poly_tomont_asm_opt)
void poly_tomont_asm_opt(int16_t *);

#define poly_mulcache_compute_asm_clean \
  MLKEM_NAMESPACE(poly_mulcache_compute_asm_clean)
void poly_mulcache_compute_asm_clean(int16_t *, const int16_t *,
                                     const int16_t *, const int16_t *);


#define poly_mulcache_compute_asm_opt \
  MLKEM_NAMESPACE(poly_mulcache_compute_asm_opt)
void poly_mulcache_compute_asm_opt(int16_t *, const int16_t *, const int16_t *,
                                   const int16_t *);

#define poly_tobytes_asm_clean MLKEM_NAMESPACE(poly_tobytes_asm_clean)
void poly_tobytes_asm_clean(uint8_t *r, const int16_t *a);

#define polyvec_basemul_acc_montgomery_cached_asm_clean \
  MLKEM_NAMESPACE(polyvec_basemul_acc_montgomery_cached_asm_clean)
void polyvec_basemul_acc_montgomery_cached_asm_clean(int16_t *r,
                                                     const int16_t *a,
                                                     const int16_t *b,
                                                     const int16_t *b_cache);

#define polyvec_basemul_acc_montgomery_cached_asm_opt \
  MLKEM_NAMESPACE(polyvec_basemul_acc_montgomery_cached_asm_opt)
void polyvec_basemul_acc_montgomery_cached_asm_opt(int16_t *r, const int16_t *a,
                                                   const int16_t *b,
                                                   const int16_t *b_cache);


#endif /* MLKEM_USE_NATIVE_AARCH64 */
#endif /* MLKEM_AARCH64_NATIVE_H */
