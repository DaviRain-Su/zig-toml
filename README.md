[![Build Status](https://github.com/DaviRain-Su/zig-toml/actions/workflows/unit_tests.yml/badge.svg)](https://github.com/DaviRain-Su/zig-toml/actions/workflows/unit_tests.yml)

# zig-toml

> Upstream with `https://github.com/darithorn/zig-toml`

A TOML parser written in Zig targeting [TOML v0.5.0](https://github.com/toml-lang/toml). The end goal is for the program to be robust, with no crashing given any situation. Though, in its current state this program is probably far from that goal.

There is currently a lack of documentation but the tests contained should give enough of an idea on how to use this.

[Quickstart Guide](https://github.com/darithorn/zig-toml/wiki/Quickstart-Guide)

## Zig Version Support
This table shows the project's current compatibility status with zig:

| Zig Version | Status |
| -- | -- |
| [0.15.0](https://ziglang.org/documentation/0.15.0/) | ✅ Supported |
| [0.11.0](https://ziglang.org/documentation/0.11.0/) | ✅ Supported |
| [0.10.1 and below](https://ziglang.org/documentation/0.10.1/) | ❌ Not Supported |

## Features
- [x] Tables
- [x] Keys (all kinds)
- [x] Single-line strings
- [x] Integers
- [x] Booleans
- [x] Arrays
- [x] Comments
- [x] Floats
- [x] Hexadecimal, octal, and binary numbers
- [ ] Multi-line strings
- [ ] String escapes
- [x] Inline tables
- [x] Array of tables
- [ ] Time and date

## Building and Usage

This library is self-contained and requires no dependencies.

To build simply run `zig build` and that will output a file called `libtoml.a` that you can link with your program.

If you want to run the tests then use the `zig build test` command.

## Changes for Zig 0.15.0

To ensure compatibility with Zig 0.15.0, several changes were necessary due to API updates in the standard library and build system:

*   **Build System (`build.zig`):**
    *   The `b.addStaticLibrary` function was replaced with `b.addLibrary` (with `.linkage = .static`).
    *   Module definitions were updated to use the `root_module` pattern.
*   **Standard Library API (`src/toml.zig`):**
    *   `std.TailQueue` was replaced with a local implementation to maintain compatibility with the original API.
    *   `std.ArrayList`'s API was updated: `init(allocator)` was removed, requiring initialization with `{}` and passing the `allocator` directly to `append` and `deinit` methods.
    *   Numerous `var` declarations were changed to `const` to adhere to stricter compiler checks regarding mutable variables.

