[//]: # (SPDX-License-Identifier: CC-BY-4.0)

# Bring your own FIPS-202

This directory contains a minimal example for how to use mlkem-native as a code package, with a custom FIPS-202
implementation. We use the [tiny_sha3](https://github.com/mjosaarinen/tiny_sha3/) by Markku-J. O. Saarinen as an
example.

## Components

An application using mlkem-native with a custom FIPS-202 implementation needs the following:

1. Arithmetic part of the mlkem-native source tree: [`mlkem/`](../../mlkem)
2. A secure pseudo random number generator, implementing [`randombytes.h`](../../mlkem/randombytes.h).
2. A custom FIPS-202 with `fips202.h` and `fips202x4.h` headers compatible with
   [`fips202/fips202.h`](../../fips202/fips202.h) and [`fips202/fips202x4.h`](../../fips202/fips202x4.h).
3. The application source code

**WARNING:** The `randombytes()` implementation used here is for TESTING ONLY. You MUST NOT use this implementation
outside of testing.

## Usage

Build this example with `make build`, run with `make run`.