// Copyright (c) 2024 The mlkem-native project authors
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

/*
 * Insert copyright notice
 */

/**
 * @file crypto_kem_enc_harness.c
 * @brief Implements the proof harness for crypto_kem_enc function.
 */

/*
 * Insert project header files that
 *   - include the declaration of the function
 *   - include the types needed to declare function arguments
 */
#include <kem.h>

/**
 * @brief Starting point for formal analysis
 *
 */
void harness(void)
{
  uint8_t *a, *b, *c;
  crypto_kem_enc(a, b, c);
}
