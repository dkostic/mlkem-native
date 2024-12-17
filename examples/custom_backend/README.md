[//]: # (SPDX-License-Identifier: CC-BY-4.0)

# Using a custom configuration and FIPS-202 backend

This directory contains a minimal example for how to use mlkem-native as a code package, with a custom FIPS-202
backend and a custom configuration. We use the [tiny_sha3](https://github.com/mjosaarinen/tiny_sha3/) by Markku-J. O.
Saarinen as an example.

## Components

An application using mlkem-native with a custom FIPS-202 backend and custom configuration needs the following:

1. Arithmetic part of the mlkem-native source tree: [`mlkem/`](../../mlkem). In this example, we disable arithmetic
   backends, hence it is safe to remove the entire `native` subfolder.
2. A secure pseudo random number generator, implementing [`randombytes.h`](../../mlkem/randombytes.h). **WARNING:** The
   `randombytes()` implementation used here is for TESTING ONLY. You MUST NOT use this implementation outside of testing.
3. FIPS-202 part of the mlkem-native source tree, [`fips/`](../../fips202). If you only want to use your backend,
   you can remove all existing backends; that's what this example does.
4. A custom FIPS-202 backend. In this example, the metadata file is
   [custom.h](mlkem_native/fips202/native/custom/custom.h), the implementation shim is
   [custom_impl.h](mlkem_native/fips202/native/custom/src/custom_impl.h), wrapping the
   [sha3.c](mlkem_native/fips202/native/custom/src/sha3.c) and setting `MLKEM_USE_FIPS101_X1_NATIVE` to indicate that we
   replace 1-fold Keccak-F1600.
5. Either modify the existing [config.h](mlkem_native/mlkem/config.h), or register a new config. In this example, we add
   a new config [custom_config.h](mlkem_native/custom_config.h) and register it from the command line for
   `-DMLKEM_NATIVE_CONFIG_FILE="custom_config.h"` -- no further changes to the build are needed. For the sake of
   demonstration, we set a custom namespace. We set `MLKEM_NATIVE_FIPS202_BACKEND` to point to our custom FIPS-202
   backend, but leave `MLKEM_NATIVE_ARITH_BACKEND` undefined to indicate that we wish to use the C backend.

## Usage

Build this example with `make build`, run with `make run`.