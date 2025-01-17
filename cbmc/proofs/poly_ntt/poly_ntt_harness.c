// Copyright (c) 2024 The mlkem-native project authors
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

/*
 * Insert copyright notice
 */

/**
 * @file poly_ntt_harness.c
 * @brief Implements the proof harness for poly_ntt function.
 */

/*
 * Insert project header files that
 *   - include the declaration of the function
 *   - include the types needed to declare function arguments
 */
#include <ntt.h>

/**
 * @brief Starting point for formal analysis
 *
 */
void harness(void)
{
  poly *a;
  poly_ntt(a);
}
