// Copyright (c) 2024 The mlkem-native project authors
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0 AND Apache-2.0

#include "polyvec.h"

void harness(void)
{
  poly *r;
  polyvec *a, *b;
  polyvec_mulcache *b_cached;

  polyvec_basemul_acc_montgomery_cached(r, a, b, b_cached);
}