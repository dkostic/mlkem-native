(*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0 OR ISC OR MIT-0
 *)

(* ========================================================================= *)
(* Scalar multiplication of 2-element polynomial vectors in NTT domain.      *)
(* ========================================================================= *)

(* Load base theories for x86_64 from s2n-bignum *)
needs "x86/proofs/base.ml";;

needs "common/mlkem_specs.ml";;


let mlkem_basemul_k2_mc =
  define_assert_from_elf "mlkem_basemul_k2_mc" "x86_64/mlkem/mlkem_poly_basemul_acc_montgomery_cached_k2.o"
(*** BYTECODE START ***)
[
  0xf3; 0x0f; 0x1e; 0xfa;  (* ENDBR64 *)
  0xb8; 0x01; 0x0d; 0x01; 0x0d;
                           (* MOV (% eax) (Imm32 (word 218172673)) *)
  0xc5; 0xf9; 0x6e; 0xc0;  (* VMOVD (%_% xmm0) (% eax) *)
  0xc4; 0xe2; 0x7d; 0x58; 0xc0;
                           (* VPBROADCASTD (%_% ymm0) (%_% xmm0) *)
  0xb8; 0x01; 0xf3; 0x01; 0xf3;
                           (* MOV (% eax) (Imm32 (word 4076991233)) *)
  0xc5; 0xf9; 0x6e; 0xc8;  (* VMOVD (%_% xmm1) (% eax) *)
  0xc4; 0xe2; 0x7d; 0x58; 0xc9;
                           (* VPBROADCASTD (%_% ymm1) (%_% xmm1) *)
  0xc5; 0xfd; 0x6f; 0x16;  (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,0))) *)
  0xc5; 0xfd; 0x6f; 0x5e; 0x20;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,32))) *)
  0xc5; 0xfd; 0x6f; 0x22;  (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,0))) *)
  0xc5; 0xfd; 0x6f; 0x6a; 0x20;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,32))) *)
  0xc5; 0xfd; 0x6f; 0x31;  (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,0))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x7f; 0x27;  (* VMOVDQA (Memop Word256 (%% (rdi,0))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0x6f; 0x20;
                           (* VMOVDQA (Memop Word256 (%% (rdi,32))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x56; 0x40;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,64))) *)
  0xc5; 0xfd; 0x6f; 0x5e; 0x60;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,96))) *)
  0xc5; 0xfd; 0x6f; 0x62; 0x40;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,64))) *)
  0xc5; 0xfd; 0x6f; 0x6a; 0x60;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,96))) *)
  0xc5; 0xfd; 0x6f; 0x71; 0x20;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,32))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x7f; 0x67; 0x40;
                           (* VMOVDQA (Memop Word256 (%% (rdi,64))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0x6f; 0x60;
                           (* VMOVDQA (Memop Word256 (%% (rdi,96))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x80; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,128))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0xa0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,160))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x80; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,128))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0xa0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,160))) *)
  0xc5; 0xfd; 0x6f; 0x71; 0x40;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,64))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15
) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0x80; 0x00; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,128))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0xa0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,160))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0xc0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,192))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0xe0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,224))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0xc0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,192))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0xe0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,224))) *)
  0xc5; 0xfd; 0x6f; 0x71; 0x60;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,96))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0xc0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,192))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0xe0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,224))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x00; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,256))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0x20; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,288))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x00; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,256))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0x20; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,288))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0x80; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,128))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0x00; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,256))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0x20; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,288))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x40; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,320))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0x60; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,352))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x40; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,320))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0x60; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,352))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0xa0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,160))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                       
    (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0x40; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,320))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0x60; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,352))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x80; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,384))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0xa0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,416))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x80; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,384))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0xa0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,416))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0xc0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,192))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0x80; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,384))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0xa0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,416))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0xc0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,448))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0xe0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,480))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0xc0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,448))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0xe0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,480))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0xe0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,224))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0xc0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,448))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0xe0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,480))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x00; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,512))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0x20; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,544))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x00; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,512))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0x20; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,544))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0x00; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,256))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xdd; 0xfd; 0x27;  (* VPADDW (%_% ymm4) (%_% ymm4) (Memop Word256 (%% (rdi,0))) *)
  0xc5; 0xd5; 0xfd; 0x6f; 0x20;
                           (* VPADDW (%_% ymm5) (%_% ymm5) (Memop Word256 (%% (rdi,32))) *)
  0xc5; 0xfd; 0x7f; 0x27;  (* VMOVDQA (Memop Word256 (%% (rdi,0))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0x6f; 0x20;
                           (* VMOVDQA (Memop Word256 (%% (rdi,32))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x40; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,576))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0x60; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,608))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x40; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,576))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0x60; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,608))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0x20; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,288))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xdd; 0xfd; 0x67; 0x40;
                           (* VPADDW (%_% ymm4) (%_% ymm4) (Memop Word256 (%% (rdi,64))) *)
  0xc5; 0xd5; 0xfd; 0x6f; 0x60;
                           (* VPADDW (%_% ymm5) (%_% ymm5) (Memop Word256 (%% (rdi,96))) *)
  0xc5; 0xfd; 0x7f; 0x67; 0x40;
                           (* VMOVDQA (Memop Word256 (%% (rdi,64))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0x6f; 0x60;
                           (* VMOVDQA (Memop Word256 (%% (rdi,96))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x80; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,640))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0xa0; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,672))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x80; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,640))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0xa0; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,672))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0x40; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,320))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xdd; 0xfd; 0xa7; 0x80; 0x00; 0x00; 0x00;
                           (* VPADDW (%_% ymm4) (%_% ymm4) (Memop Word256 (%% (rdi,128))) *)
  0xc5; 0xd5; 0xfd; 0xaf; 0xa0; 0x00; 0x00; 0x00;
                           (* VPADDW (%_% ymm5) (%_% ymm5) (Memop Word256 (%% (rdi,160))) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0x80; 0x00; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,128))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0xa0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,160))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0xc0; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,704))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0xe0; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,736))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0xc0; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,704))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0xe0; 0x02; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,736))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0x60; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,352))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xdd; 0xfd; 0xa7; 0xc0; 0x00; 0x00; 0x00;
                           (* VPADDW (%_% ymm4) (%_% ymm4) (Memop Word256 (%% (rdi,192))) *)
  0xc5; 0xd5; 0xfd; 0xaf; 0xe0; 0x00; 0x00; 0x00;
                           (* VPADDW (%_% ymm5) (%_% ymm5) (Memop Word256 (%% (rdi,224))) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0xc0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,192))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0xe0; 0x00; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,224))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x00; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,768))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0x20; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,800))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x00; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,768))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0x20; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,800))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0x80; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,384))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xdd; 0xfd; 0xa7; 0x00; 0x01; 0x00; 0x00;
                           (* VPADDW (%_% ymm4) (%_% ymm4) (Memop Word256 (%% (rdi,256))) *)
  0xc5; 0xd5; 0xfd; 0xaf; 0x20; 0x01; 0x00; 0x00;
                           (* VPADDW (%_% ymm5) (%_% ymm5) (Memop Word256 (%% (rdi,288))) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0x00; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,256))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0x20; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,288))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x40; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,832))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0x60; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,864))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x40; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,832))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0x60; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,864))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0xa0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,416))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xdd; 0xfd; 0xa7; 0x40; 0x01; 0x00; 0x00;
                           (* VPADDW (%_% ymm4) (%_% ymm4) (Memop Word256 (%% (rdi,320))) *)
  0xc5; 0xd5; 0xfd; 0xaf; 0x60; 0x01; 0x00; 0x00;
                           (* VPADDW (%_% ymm5) (%_% ymm5) (Memop Word256 (%% (rdi,352))) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0x40; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,320))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0x60; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,352))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0x80; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,896))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0xa0; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,928))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0x80; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,896))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0xa0; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,928))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0xc0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,448))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfe; 0xd3;  (* VPADDD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xdd; 0xfd; 0xa7; 0x80; 0x01; 0x00; 0x00;
                           (* VPADDW (%_% ymm4) (%_% ymm4) (Memop Word256 (%% (rdi,384))) *)
  0xc5; 0xd5; 0xfd; 0xaf; 0xa0; 0x01; 0x00; 0x00;
                           (* VPADDW (%_% ymm5) (%_% ymm5) (Memop Word256 (%% (rdi,416))) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0x80; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,384))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0xa0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,416))) (%_% ymm5) *)
  0xc5; 0xfd; 0x6f; 0x96; 0xc0; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm2) (Memop Word256 (%% (rsi,960))) *)
  0xc5; 0xfd; 0x6f; 0x9e; 0xe0; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm3) (Memop Word256 (%% (rsi,992))) *)
  0xc5; 0xfd; 0x6f; 0xa2; 0xc0; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm4) (Memop Word256 (%% (rdx,960))) *)
  0xc5; 0xfd; 0x6f; 0xaa; 0xe0; 0x03; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm5) (Memop Word256 (%% (rdx,992))) *)
  0xc5; 0xfd; 0x6f; 0xb1; 0xe0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (%_% ymm6) (Memop Word256 (%% (rcx,480))) *)
  0xc5; 0xdd; 0xd5; 0xfa;  (* VPMULLW (%_% ymm7) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x5d; 0xe5; 0xc2;  (* VPMULHW (%_% ymm8) (%_% ymm4) (%_% ymm2) *)
  0xc5; 0x4d; 0xd5; 0xcb;  (* VPMULLW (%_% ymm9) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x4d; 0xe5; 0xd3;  (* VPMULHW (%_% ymm10) (%_% ymm6) (%_% ymm3) *)
  0xc5; 0x55; 0xd5; 0xda;  (* VPMULLW (%_% ymm11) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x55; 0xe5; 0xe2;  (* VPMULHW (%_% ymm12) (%_% ymm5) (%_% ymm2) *)
  0xc5; 0x5d; 0xd5; 0xeb;  (* VPMULLW (%_% ymm13) (%_% ymm4) (%_% ymm3) *)
  0xc5; 0x5d; 0xe5; 0xf3;  (* VPMULHW (%_% ymm14) (%_% ymm4) (%_% ymm3) *)
  0xc4; 0xc1; 0x45; 0x61; 0xd0;
                           (* VPUNPCKLWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x61; 0xda;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x61; 0xdc;
                           (* VPUNPCKLWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x61; 0xe6;
                           (* VPUNPCKLWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xf2;  (* VMOVDQA (%_% ymm6) (%_% ymm2) *)
  0xc4; 0xc1; 0x45; 0x69; 0xd0;
                           (* VPUNPCKHWD (%_% ymm2) (%_% ymm7) (%_% ymm8) *)
  0xc4; 0xc1; 0x35; 0x69; 0xda;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm9) (%_% ymm10) *)
  0xc5; 0xed; 0xfa; 0xd3;  (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc5; 0x75; 0xd5; 0xfa;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm2) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x6d; 0xfa; 0xd7;
                           (* VPSUBD (%_% ymm2) (%_% ymm2) (%_% ymm15) *)
  0xc5; 0xed; 0x72; 0xe2; 0x10;
                           (* VPSRAD (%_% ymm2) (%_% ymm2) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x25; 0x69; 0xdc;
                           (* VPUNPCKHWD (%_% ymm3) (%_% ymm11) (%_% ymm12) *)
  0xc4; 0xc1; 0x15; 0x69; 0xe6;
                           (* VPUNPCKHWD (%_% ymm4) (%_% ymm13) (%_% ymm14) *)
  0xc5; 0xe5; 0xfe; 0xdc;  (* VPADDD (%_% ymm3) (%_% ymm3) (%_% ymm4) *)
  0xc5; 0x75; 0xd5; 0xfb;  (* VPMULLW (%_% ymm15) (%_% ymm1) (%_% ymm3) *)
  0xc4; 0x41; 0x7d; 0xe5; 0xff;
                           (* VPMULHW (%_% ymm15) (%_% ymm0) (%_% ymm15) *)
  0xc4; 0xc1; 0x05; 0x72; 0xf7; 0x10;
                           (* VPSLLD (%_% ymm15) (%_% ymm15) (Imm8 (word 16)) *)
  0xc4; 0xc1; 0x65; 0xfa; 0xdf;
                           (* VPSUBD (%_% ymm3) (%_% ymm3) (%_% ymm15) *)
  0xc5; 0xe5; 0x72; 0xe3; 0x10;
                           (* VPSRAD (%_% ymm3) (%_% ymm3) (Imm8 (word 16)) *)
  0xc5; 0xed; 0x6b; 0xd3;  (* VPACKSSDW (%_% ymm2) (%_% ymm2) (%_% ymm3) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xd2; 0xd8;
                           (* VPERMQ (%_% ymm2) (%_% ymm2) (Imm8 (word 216)) *)
  0xc5; 0xfd; 0x6f; 0xde;  (* VMOVDQA (%_% ymm3) (%_% ymm6) *)
  0xc4; 0xe3; 0x65; 0x46; 0xe2; 0x20;
                           (* VPERM2I128 (%_% ymm4) (%_% ymm3) (%_% ymm2) (Imm8 (word 32)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xe4; 0xd8;
                           (* VPERMQ (%_% ymm4) (%_% ymm4) (Imm8 (word 216)) *)
  0xc4; 0xe3; 0x65; 0x46; 0xea; 0x31;
                           (* VPERM2I128 (%_% ymm5) (%_% ymm3) (%_% ymm2) (Imm8 (word 49)) *)
  0xc4; 0xe3; 0xfd; 0x00; 0xed; 0xd8;
                           (* VPERMQ (%_% ymm5) (%_% ymm5) (Imm8 (word 216)) *)
  0xc5; 0xdd; 0xfd; 0xa7; 0xc0; 0x01; 0x00; 0x00;
                           (* VPADDW (%_% ymm4) (%_% ymm4) (Memop Word256 (%% (rdi,448))) *)
  0xc5; 0xd5; 0xfd; 0xaf; 0xe0; 0x01; 0x00; 0x00;
                           (* VPADDW (%_% ymm5) (%_% ymm5) (Memop Word256 (%% (rdi,480))) *)
  0xc5; 0xfd; 0x7f; 0xa7; 0xc0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,448))) (%_% ymm4) *)
  0xc5; 0xfd; 0x7f; 0xaf; 0xe0; 0x01; 0x00; 0x00;
                           (* VMOVDQA (Memop Word256 (%% (rdi,480))) (%_% ymm5) *)
  0xc3                     (* RET *)
];;
(*** BYTECODE END ***)

let mlkem_basemul_k2_tmc = define_trimmed "mlkem_basemul_k2_tmc" mlkem_basemul_k2_mc;;
let mlkem_basemul_k2_tmc_EXEC = X86_MK_CORE_EXEC_RULE mlkem_basemul_k2_tmc;;

let LENGTH_MLKEM_BASEMUL_K2_TMC =
  REWRITE_CONV[mlkem_basemul_k2_tmc] `LENGTH mlkem_basemul_k2_tmc`
  |> CONV_RULE(RAND_CONV LENGTH_CONV);;

let MLKEM_BASEMUL_K2_POSTAMBLE_LENGTH = new_definition
  `MLKEM_BASEMUL_K2_POSTAMBLE_LENGTH = 1`;;

let MLKEM_BASEMUL_K2_CORE_END = new_definition
  `MLKEM_BASEMUL_K2_CORE_END = LENGTH mlkem_basemul_k2_tmc - MLKEM_BASEMUL_K2_POSTAMBLE_LENGTH`;;

let LENGTH_SIMPLIFY_CONV =
  REWRITE_CONV[LENGTH_MLKEM_BASEMUL_K2_TMC;
              MLKEM_BASEMUL_K2_CORE_END;
              MLKEM_BASEMUL_K2_POSTAMBLE_LENGTH] THENC
  NUM_REDUCE_CONV THENC REWRITE_CONV [ADD_0];;

(* Enable simplification of word_subwords by default.
   Nedded to prevent the symbolic simulation to explode
   as we add more instructions. *)
let org_extra_word_conv = !extra_word_CONV;;
extra_word_CONV := [WORD_SIMPLE_SUBWORD_CONV] @ !extra_word_CONV;;


(* (a + bX) * (c + dX) = (a*c + b*dz) + (a*d + b*c)X *)
let pmul0 = define
  `pmul0 (a: int) (b : int) (c : int) (dz : int) = b*dz + a*c`;;

let pmul0_odd = define
  `pmul0_odd (a: int) (b : int) (c : int) (dz : int) = a*c - b*dz`;;

let pmul1 = define
  `pmul1 (a: int) (b : int) (c : int) (d : int) = b*c + a*d`;;

let pmulacc0 = define
  `pmulacc0 (a0: int) (b0 : int) (c0 : int) (d0 : int) (dz0 : int)
            (a1: int) (b1 : int) (c1 : int) (d1 : int) (dz1 : int) =
              pmul0 a0 b0 c0 dz0 + pmul0 a1 b1 c1 dz1`;;

let pmulacc0_odd = define
  `pmulacc0_odd (a0: int) (b0 : int) (c0 : int) (d0 : int) (dz0 : int)
                (a1: int) (b1 : int) (c1 : int) (d1 : int) (dz1 : int) =
              pmul0_odd a0 b0 c0 dz0 + pmul0_odd a1 b1 c1 dz1`;;

let pmulacc1 = define
  `pmulacc1 (a0: int) (b0 : int) (c0 : int) (d0 : int) (dz0 : int)
            (a1: int) (b1 : int) (c1 : int) (d1 : int) (dz1 : int) =
              pmul1 a0 b0 c0 d0 + pmul1 a1 b1 c1 d1`;;

let pmulaccred0 = define
  `pmulaccred0 (a0: int) (b0 : int) (c0 : int) (d0 : int) (dz0 : int)
               (a1: int) (b1 : int) (c1 : int) (d1 : int) (dz1 : int) =
     (&(inverse_mod 3329 65536) * pmulacc0 a0 b0 c0 d0 dz0 a1 b1 c1 d1 dz1) rem &3329`;;

let pmulaccred0_odd = define
  `pmulaccred0_odd (a0: int) (b0 : int) (c0 : int) (d0 : int) (dz0 : int)
                   (a1: int) (b1 : int) (c1 : int) (d1 : int) (dz1 : int) =
     (&(inverse_mod 3329 65536) * pmulacc0_odd a0 b0 c0 d0 dz0 a1 b1 c1 d1 dz1) rem &3329`;;


let pmulaccred1 = define
  `pmulaccred1 (a0: int) (b0 : int) (c0 : int) (d0 : int) (dz0 : int)
               (a1: int) (b1 : int) (c1 : int) (d1 : int) (dz1 : int) =
     (&(inverse_mod 3329 65536) * pmulacc1 a0 b0 c0 d0 dz0 a1 b1 c1 d1 dz1) rem &3329`;;

let MLKEM_BASEMUL_K2_CORRECT = prove(
  `!src1 src2 src2t dst a0 b0 c0 d0 dz0 a1 b1 c1 d1 dz1 pc.
        aligned 32 src1 /\
        aligned 32 src2 /\
        aligned 32 src2t /\
        aligned 32 dst /\
        ALL (nonoverlapping (dst, 512)) [(src1, 1024); (src2, 1024); (src2t, 512)] /\
        nonoverlapping (dst, 512) (word pc, LENGTH mlkem_basemul_k2_tmc)
        ==> ensures x86
              (\s. bytes_loaded s (word pc) (BUTLAST mlkem_basemul_k2_tmc) /\
                   read RIP s = word pc /\
                   C_ARGUMENTS [dst; src1; src2; src2t] s /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (64*j + 2*i)))) s = a0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (64*j + 32 + 2*i)))) s = b0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (64*j + 2*i)))) s = c0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (64*j + 32 + 2*i)))) s = d0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2t (word (32*j + 2*i)))) s = dz0 i j) /\

                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (512 + 64*j + 2*i)))) s = a1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (512 + 64*j + 32 + 2*i)))) s = b1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (512 + 64*j + 2*i)))) s = c1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (512 + 64*j + 32 + 2*i)))) s = d1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2t (word (256 + 32*j + 2*i)))) s = dz1 i j))
              (\s. read RIP s = word (pc + MLKEM_BASEMUL_K2_CORE_END) /\
                   (!i. i < 16 ==> !j. j < 4
                        ==> (let j' = 2*j in
                              (abs(ival(a0 i j')) <= &2 pow 12  /\
                               abs(ival(b0 i j')) <= &2 pow 12  /\
                               abs(ival(a1 i j')) <= &2 pow 12  /\
                               abs(ival(b1 i j')) <= &2 pow 12
                               ==>
                               (ival (read(memory :> bytes16 (word_add dst (word (64*j' + 2*i)))) s)
                                ==
                                pmulaccred0 (ival (a0 i j')) (ival (b0 i j')) (ival (c0 i j')) (ival (d0 i j')) (ival (dz0 i j'))
                                            (ival (a1 i j')) (ival (b1 i j')) (ival (c1 i j')) (ival (d1 i j')) (ival (dz1 i j'))
                               ) (mod &3329)))) /\

                   (!i. i < 16 ==> !j. j < 4
                        ==> (let j' = 2*j+1 in
                              (abs(ival(a0 i j')) <= &2 pow 12  /\
                               abs(ival(b0 i j')) <= &2 pow 12  /\
                               abs(ival(a1 i j')) <= &2 pow 12  /\
                               abs(ival(b1 i j')) <= &2 pow 12
                               ==>
                               (ival (read(memory :> bytes16 (word_add dst (word (64*j' + 2*i)))) s)
                                ==
                                pmulaccred0_odd (ival (a0 i j')) (ival (b0 i j')) (ival (c0 i j')) (ival (d0 i j')) (ival (dz0 i j'))
                                            (ival (a1 i j')) (ival (b1 i j')) (ival (c1 i j')) (ival (d1 i j')) (ival (dz1 i j'))
                               ) (mod &3329)))) /\

                   (!i. i < 16 ==> !j. j < 8
                        ==> abs(ival(a0 i j)) <= &2 pow 12  /\
                            abs(ival(b0 i j)) <= &2 pow 12  /\
                            abs(ival(a1 i j)) <= &2 pow 12  /\
                            abs(ival(b1 i j)) <= &2 pow 12
                        ==> (ival (read(memory :> bytes16 (word_add dst (word (64*j + 32 + 2*i)))) s)
                             ==
                             pmulaccred1 (ival (a0 i j)) (ival (b0 i j)) (ival (c0 i j)) (ival (d0 i j)) (ival (dz0 i j))
                                         (ival (a1 i j)) (ival (b1 i j)) (ival (c1 i j)) (ival (d1 i j)) (ival (dz1 i j))
                            ) (mod &3329)))
              (MAYCHANGE [events] ,,
               MAYCHANGE [RIP] ,, MAYCHANGE [RAX] ,,
               MAYCHANGE [ZMM0; ZMM1; ZMM2; ZMM3; ZMM4; ZMM5; ZMM6; ZMM7;
                          ZMM8; ZMM9; ZMM10; ZMM11; ZMM12; ZMM13; ZMM14; ZMM15] ,,
               MAYCHANGE [memory :> bytes(dst, 512)])`,

  CONV_TAC LENGTH_SIMPLIFY_CONV THEN
  REWRITE_TAC [MAYCHANGE_REGS_AND_FLAGS_PERMITTED_BY_ABI;
    NONOVERLAPPING_CLAUSES; ALL; C_ARGUMENTS; fst mlkem_basemul_k2_tmc_EXEC] THEN
  REPEAT STRIP_TAC THEN

  GHOST_INTRO_TAC `init_ymm0:int256` `read YMM0` THEN
  GHOST_INTRO_TAC `init_ymm1:int256` `read YMM1` THEN

  CONV_TAC(RATOR_CONV(LAND_CONV(TOP_DEPTH_CONV EXPAND_CASES_CONV))) THEN
  CONV_TAC(TOP_DEPTH_CONV NUM_MULT_CONV THENC
           TOP_DEPTH_CONV NUM_ADD_CONV) THEN

  ENSURES_INIT_TAC "s0" THEN

  MEMORY_256_FROM_16_TAC "src1" 64 THEN
  MEMORY_256_FROM_16_TAC "src2" 64 THEN
  MEMORY_256_FROM_16_TAC "src2t" 32 THEN

  ASM_REWRITE_TAC [WORD_ADD_0] THEN
  DISCARD_MATCHING_ASSUMPTIONS [`read (memory :> bytes16 any) s = x`] THEN
  REPEAT STRIP_TAC THEN

  (* Per-step tactic for lazy basemul accumulation:
   * 1. SIMD_SIMPLIFY_TAC normalizes subword-of-join extractions
   * 2. WORD_SHL_JOIN_16 eliminates word_join from word_shl (montred prep)
   * 3. GSYM montred_x86_32bit folds the 5-instruction Montgomery reduction
   * 4. After VPACKSSDW: MONTRED_X86_32_EQ_SX converts to word_sx(montred_x86)
   *    and SAT_WORD_SX_NOLET eliminates saturation conditionals *)
  let LAZY_SIMD_TAC =
    SIMD_SIMPLIFY_TAC [] THEN
    TRY(FIRST_X_ASSUM(fun th ->
      if can (term_match [] `read X (s:x86state) = whatever:int256`) (concl th)
      then
        let th' = CONV_RULE (RAND_CONV (
           TRY_CONV(DEPTH_CONV (REWR_CONV WORD_SHL_JOIN_16)) THENC
           TRY_CONV(DEPTH_CONV (REWR_CONV (GSYM montred_x86_32bit))))) th in
        let rhs = rand(concl th') in
        let th'' =
          if can (find_term is_cond) rhs
          then CONV_RULE (RAND_CONV (
                 REWRITE_CONV[MONTRED_X86_32_EQ_SX] THENC
                 DEPTH_CONV(REWR_CONV SAT_WORD_SX_NOLET))) th'
          else th' in
        ASSUME_TAC th''
      else FAIL_TAC "")) in

  MAP_EVERY (fun n -> X86_STEPS_TAC mlkem_basemul_k2_tmc_EXEC [n] THEN
                      LAZY_SIMD_TAC)
            (1--934) THEN

  ENSURES_FINAL_STATE_TAC THEN
  ASM_REWRITE_TAC[] THEN

  REPEAT(FIRST_X_ASSUM(STRIP_ASSUME_TAC o
  CONV_RULE(SIMD_SIMPLIFY_CONV[]) o
  CONV_RULE(READ_MEMORY_SPLIT_CONV 4) o
  check (can (term_match [] `read qqq s:int256 = xxx`) o concl))) THEN

  CONV_TAC(TOP_DEPTH_CONV EXPAND_CASES_CONV) THEN
  CONV_TAC(DEPTH_CONV NUM_MULT_CONV THENC
           DEPTH_CONV NUM_ADD_CONV THENC
           DEPTH_CONV let_CONV) THEN
  CONV_TAC(DEPTH_CONV NUM_MULT_CONV THENC
           DEPTH_CONV NUM_ADD_CONV THENC
           DEPTH_CONV let_CONV) THEN
  ASM_REWRITE_TAC[WORD_ADD_0] THEN

  DISCARD_STATE_TAC "s934" THEN

  REPEAT CONJ_TAC THEN
  REWRITE_TAC[pmulaccred0; pmulacc0; pmul0; pmulaccred0_odd;
              pmulacc0_odd; pmul0_odd; pmulaccred1; pmulacc1; pmul1] THEN
  STRIP_TAC THEN
  ASSUM_LIST((fun ths -> W(MP_TAC o CONJUNCT1 o GEN_CONGBOUND_RULE ths o
    rand o lhand o rator o snd))) THEN
  REWRITE_TAC[GSYM INT_REM_EQ] THEN CONV_TAC INT_REM_DOWN_CONV THEN
  MATCH_MP_TAC EQ_IMP THEN AP_TERM_TAC THEN AP_THM_TAC THEN AP_TERM_TAC THEN
  CONV_TAC INT_RING
);;

let MLKEM_BASEMUL_K2_NOIBT_SUBROUTINE_CORRECT = prove(
  `!src1 src2 src2t dst a0 b0 c0 d0 dz0 a1 b1 c1 d1 dz1 pc stackpointer returnaddress.
        aligned 32 src1 /\
        aligned 32 src2 /\
        aligned 32 src2t /\
        aligned 32 dst /\
        ALL (nonoverlapping (dst, 512)) [(src1, 1024); (src2, 1024); (src2t, 512)] /\
        nonoverlapping (dst, 512) (word pc, LENGTH mlkem_basemul_k2_tmc) /\
        nonoverlapping (dst, 512) (stackpointer, 8)
        ==> ensures x86
              (\s. bytes_loaded s (word pc) mlkem_basemul_k2_tmc /\
                   read RIP s = word pc /\
                   read RSP s = stackpointer /\
                   read (memory :> bytes64 stackpointer) s = returnaddress /\
                   C_ARGUMENTS [dst; src1; src2; src2t] s /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (64*j + 2*i)))) s = a0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (64*j + 32 + 2*i)))) s = b0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (64*j + 2*i)))) s = c0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (64*j + 32 + 2*i)))) s = d0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2t (word (32*j + 2*i)))) s = dz0 i j) /\

                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (512 + 64*j + 2*i)))) s = a1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (512 + 64*j + 32 + 2*i)))) s = b1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (512 + 64*j + 2*i)))) s = c1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (512 + 64*j + 32 + 2*i)))) s = d1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2t (word (256 + 32*j + 2*i)))) s = dz1 i j))
              (\s. read RIP s = returnaddress /\
                   read RSP s = word_add stackpointer (word 8) /\
                   (!i. i < 16 ==> !j. j < 4
                        ==> (let j' = 2*j in
                              (abs(ival(a0 i j')) <= &2 pow 12  /\
                               abs(ival(b0 i j')) <= &2 pow 12  /\
                               abs(ival(a1 i j')) <= &2 pow 12  /\
                               abs(ival(b1 i j')) <= &2 pow 12
                               ==>
                               (ival (read(memory :> bytes16 (word_add dst (word (64*j' + 2*i)))) s)
                                ==
                                pmulaccred0 (ival (a0 i j')) (ival (b0 i j')) (ival (c0 i j')) (ival (d0 i j')) (ival (dz0 i j'))
                                            (ival (a1 i j')) (ival (b1 i j')) (ival (c1 i j')) (ival (d1 i j')) (ival (dz1 i j'))
                               ) (mod &3329)))) /\

                   (!i. i < 16 ==> !j. j < 4
                        ==> (let j' = 2*j+1 in
                              (abs(ival(a0 i j')) <= &2 pow 12  /\
                               abs(ival(b0 i j')) <= &2 pow 12  /\
                               abs(ival(a1 i j')) <= &2 pow 12  /\
                               abs(ival(b1 i j')) <= &2 pow 12
                               ==>
                               (ival (read(memory :> bytes16 (word_add dst (word (64*j' + 2*i)))) s)
                                ==
                                pmulaccred0_odd (ival (a0 i j')) (ival (b0 i j')) (ival (c0 i j')) (ival (d0 i j')) (ival (dz0 i j'))
                                            (ival (a1 i j')) (ival (b1 i j')) (ival (c1 i j')) (ival (d1 i j')) (ival (dz1 i j'))
                               ) (mod &3329)))) /\

                   (!i. i < 16 ==> !j. j < 8
                        ==> abs(ival(a0 i j)) <= &2 pow 12  /\
                            abs(ival(b0 i j)) <= &2 pow 12  /\
                            abs(ival(a1 i j)) <= &2 pow 12  /\
                            abs(ival(b1 i j)) <= &2 pow 12
                        ==> (ival (read(memory :> bytes16 (word_add dst (word (64*j + 32 + 2*i)))) s)
                             ==
                             pmulaccred1 (ival (a0 i j)) (ival (b0 i j)) (ival (c0 i j)) (ival (d0 i j)) (ival (dz0 i j))
                                         (ival (a1 i j)) (ival (b1 i j)) (ival (c1 i j)) (ival (d1 i j)) (ival (dz1 i j))
                            ) (mod &3329)))
              (MAYCHANGE [RSP] ,, MAYCHANGE_REGS_AND_FLAGS_PERMITTED_BY_ABI ,,
               MAYCHANGE [memory :> bytes(dst, 512)])`,
  CONV_TAC LENGTH_SIMPLIFY_CONV THEN
  X86_PROMOTE_RETURN_NOSTACK_TAC mlkem_basemul_k2_tmc
    (CONV_RULE LENGTH_SIMPLIFY_CONV MLKEM_BASEMUL_K2_CORRECT));;

(* NOTE: This must be kept in sync with the CBMC specification
 * in mlkem/src/native/x86_64/src/arith_native_x86_64.h *)

let MLKEM_BASEMUL_K2_SUBROUTINE_CORRECT = prove(
  `!src1 src2 src2t dst a0 b0 c0 d0 dz0 a1 b1 c1 d1 dz1 pc stackpointer returnaddress.
        aligned 32 src1 /\
        aligned 32 src2 /\
        aligned 32 src2t /\
        aligned 32 dst /\
        ALL (nonoverlapping (dst, 512)) [(src1, 1024); (src2, 1024); (src2t, 512)] /\
        nonoverlapping (dst, 512) (word pc, LENGTH mlkem_basemul_k2_mc) /\
        nonoverlapping (dst, 512) (stackpointer, 8)
        ==> ensures x86
              (\s. bytes_loaded s (word pc) mlkem_basemul_k2_mc /\
                   read RIP s = word pc /\
                   read RSP s = stackpointer /\
                   read (memory :> bytes64 stackpointer) s = returnaddress /\
                   C_ARGUMENTS [dst; src1; src2; src2t] s /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (64*j + 2*i)))) s = a0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (64*j + 32 + 2*i)))) s = b0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (64*j + 2*i)))) s = c0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (64*j + 32 + 2*i)))) s = d0 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2t (word (32*j + 2*i)))) s = dz0 i j) /\

                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (512 + 64*j + 2*i)))) s = a1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src1 (word (512 + 64*j + 32 + 2*i)))) s = b1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (512 + 64*j + 2*i)))) s = c1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2 (word (512 + 64*j + 32 + 2*i)))) s = d1 i j) /\
                   (!i. i < 16 ==> !j. j < 8
                        ==> read(memory :> bytes16
                             (word_add src2t (word (256 + 32*j + 2*i)))) s = dz1 i j))
              (\s. read RIP s = returnaddress /\
                   read RSP s = word_add stackpointer (word 8) /\
                   (!i. i < 16 ==> !j. j < 4
                        ==> (let j' = 2*j in
                              (abs(ival(a0 i j')) <= &2 pow 12  /\
                               abs(ival(b0 i j')) <= &2 pow 12  /\
                               abs(ival(a1 i j')) <= &2 pow 12  /\
                               abs(ival(b1 i j')) <= &2 pow 12
                               ==>
                               (ival (read(memory :> bytes16 (word_add dst (word (64*j' + 2*i)))) s)
                                ==
                                pmulaccred0 (ival (a0 i j')) (ival (b0 i j')) (ival (c0 i j')) (ival (d0 i j')) (ival (dz0 i j'))
                                            (ival (a1 i j')) (ival (b1 i j')) (ival (c1 i j')) (ival (d1 i j')) (ival (dz1 i j'))
                               ) (mod &3329)))) /\

                   (!i. i < 16 ==> !j. j < 4
                        ==> (let j' = 2*j+1 in
                              (abs(ival(a0 i j')) <= &2 pow 12  /\
                               abs(ival(b0 i j')) <= &2 pow 12  /\
                               abs(ival(a1 i j')) <= &2 pow 12  /\
                               abs(ival(b1 i j')) <= &2 pow 12
                               ==>
                               (ival (read(memory :> bytes16 (word_add dst (word (64*j' + 2*i)))) s)
                                ==
                                pmulaccred0_odd (ival (a0 i j')) (ival (b0 i j')) (ival (c0 i j')) (ival (d0 i j')) (ival (dz0 i j'))
                                            (ival (a1 i j')) (ival (b1 i j')) (ival (c1 i j')) (ival (d1 i j')) (ival (dz1 i j'))
                               ) (mod &3329)))) /\

                   (!i. i < 16 ==> !j. j < 8
                        ==> abs(ival(a0 i j)) <= &2 pow 12  /\
                            abs(ival(b0 i j)) <= &2 pow 12  /\
                            abs(ival(a1 i j)) <= &2 pow 12  /\
                            abs(ival(b1 i j)) <= &2 pow 12
                        ==> (ival (read(memory :> bytes16 (word_add dst (word (64*j + 32 + 2*i)))) s)
                             ==
                             pmulaccred1 (ival (a0 i j)) (ival (b0 i j)) (ival (c0 i j)) (ival (d0 i j)) (ival (dz0 i j))
                                         (ival (a1 i j)) (ival (b1 i j)) (ival (c1 i j)) (ival (d1 i j)) (ival (dz1 i j))
                            ) (mod &3329)))
              (MAYCHANGE [RSP] ,, MAYCHANGE_REGS_AND_FLAGS_PERMITTED_BY_ABI ,,
               MAYCHANGE [memory :> bytes(dst, 512)])`,
  MATCH_ACCEPT_TAC(ADD_IBT_RULE MLKEM_BASEMUL_K2_NOIBT_SUBROUTINE_CORRECT));;

(* ------------------------------------------------------------------------- *)
(* Constant-time and memory safety proof.                                    *)
(* ------------------------------------------------------------------------- *)

needs "x86/proofs/consttime.ml";;
needs "x86_64/proofs/subroutine_signatures.ml";;
needs "common/consttime_utils.ml";;

let full_spec,public_vars = mk_safety_spec
    ~keep_maychanges:true
    (assoc "mlkem_basemul_k2" subroutine_signatures)
    MLKEM_BASEMUL_K2_CORRECT
    mlkem_basemul_k2_tmc_EXEC;;

let MLKEM_BASEMUL_K2_SAFE = time prove
 (`exists f_events.
       forall e src1 src2 src2t dst pc.
           aligned 32 src1 /\
           aligned 32 src2 /\
           aligned 32 src2t /\
           aligned 32 dst /\
           ALL (nonoverlapping (dst,512)) [src1,1024; src2,1024; src2t,512] /\
           nonoverlapping (dst,512) (word pc,LENGTH mlkem_basemul_k2_tmc)
           ==> ensures x86
               (\s.
                    bytes_loaded s (word pc)
                      (BUTLAST mlkem_basemul_k2_tmc) /\
                    read RIP s = word pc /\
                    C_ARGUMENTS [dst; src1; src2; src2t] s /\
                    read events s = e)
               (\s.
                    read RIP s = word (pc + MLKEM_BASEMUL_K2_CORE_END) /\
                    (exists e2.
                         read events s = APPEND e2 e /\
                         e2 = f_events src1 src2 src2t dst pc /\
                         memaccess_inbounds e2
                           [src1,1024; src2,1024; src2t,512; dst,512]
                           [dst,512]))
               (MAYCHANGE [events] ,,
              MAYCHANGE [RIP] ,,
              MAYCHANGE [RAX] ,,
              MAYCHANGE
              [ZMM0; ZMM1; ZMM2; ZMM3; ZMM4; ZMM5; ZMM6; ZMM7;
               ZMM8; ZMM9; ZMM10; ZMM11; ZMM12; ZMM13; ZMM14; ZMM15] ,,
              MAYCHANGE [memory :> bytes (dst,512)])`,
  ASSERT_CONCL_TAC full_spec THEN
  CONV_TAC LENGTH_SIMPLIFY_CONV THEN
  PROVE_SAFETY_SPEC_TAC ~public_vars:public_vars mlkem_basemul_k2_tmc_EXEC);;

let MLKEM_BASEMUL_K2_NOIBT_SUBROUTINE_SAFE = time prove
 (`exists f_events.
       forall e src1 src2 src2t dst pc stackpointer returnaddress.
          aligned 32 src1 /\
          aligned 32 src2 /\
          aligned 32 src2t /\
          aligned 32 dst /\
          ALL (nonoverlapping (dst,512)) [src1,1024; src2,1024; src2t,512] /\
          nonoverlapping (dst,512) (word pc,LENGTH mlkem_basemul_k2_tmc) /\
          nonoverlapping (stackpointer, 8) (dst, 512)
          ==> ensures x86
               (\s.
                    bytes_loaded s (word pc) mlkem_basemul_k2_tmc /\
                    read RIP s = word pc /\
                    read RSP s = stackpointer /\
                    read (memory :> bytes64 stackpointer) s = returnaddress /\
                    C_ARGUMENTS [dst; src1; src2; src2t] s /\
                    read events s = e)
               (\s. read RIP s = returnaddress /\
                    read RSP s = word_add stackpointer (word 8) /\
                    (exists e2.
                         read events s = APPEND e2 e /\
                         e2 = f_events src1 src2 src2t dst pc
                                       stackpointer returnaddress /\
                         memaccess_inbounds e2
                           [src1,1024; src2,1024; src2t,512;
                            dst,512; stackpointer,8]
                           [dst,512; stackpointer,8]))
               (\s s'. true)`,
  X86_PROMOTE_RETURN_NOSTACK_TAC mlkem_basemul_k2_tmc
    (CONV_RULE LENGTH_SIMPLIFY_CONV MLKEM_BASEMUL_K2_SAFE) THEN
  DISCHARGE_SAFETY_PROPERTY_TAC);;

let MLKEM_BASEMUL_K2_SUBROUTINE_SAFE = time prove
 (`exists f_events.
       forall e src1 src2 src2t dst pc stackpointer returnaddress.
          aligned 32 src1 /\
          aligned 32 src2 /\
          aligned 32 src2t /\
          aligned 32 dst /\
          ALL (nonoverlapping (dst,512)) [src1,1024; src2,1024; src2t,512] /\
          nonoverlapping (dst,512) (word pc,LENGTH mlkem_basemul_k2_mc) /\
          nonoverlapping (stackpointer, 8) (dst, 512)
          ==> ensures x86
               (\s.
                    bytes_loaded s (word pc) mlkem_basemul_k2_mc /\
                    read RIP s = word pc /\
                    read RSP s = stackpointer /\
                    read (memory :> bytes64 stackpointer) s = returnaddress /\
                    C_ARGUMENTS [dst; src1; src2; src2t] s /\
                    read events s = e)
               (\s. read RIP s = returnaddress /\
                    read RSP s = word_add stackpointer (word 8) /\
                    (exists e2.
                         read events s = APPEND e2 e /\
                         e2 = f_events src1 src2 src2t dst pc
                                       stackpointer returnaddress /\
                         memaccess_inbounds e2
                           [src1,1024; src2,1024; src2t,512;
                            dst,512; stackpointer,8]
                           [dst,512; stackpointer,8]))
               (\s s'. true)`,
  MATCH_ACCEPT_TAC(ADD_IBT_RULE MLKEM_BASEMUL_K2_NOIBT_SUBROUTINE_SAFE));;
