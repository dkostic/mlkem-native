// Copyright (c) 2024 The mlkem-native project authors
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

/*
 * Insert copyright notice
 */

/**
 * @file poly_cbd_eta1_harness.c
 * @brief Implements the proof harness for poly_cbd_eta1 function.
 */

/*
 * Insert project header files that
 *   - include the declaration of the function
 *   - include the types needed to declare function arguments
 */
#include <cbd.h>

/**
 * @brief Starting point for formal analysis
 *
 */
void harness(void)
{
  uint8_t *buf;
  poly *a;

  poly_cbd_eta1(a, buf);
}
