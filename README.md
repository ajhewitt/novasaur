# Novasaur
Retrocomputer built from late‑70's TTL logic chips
```
                                                   ...
          |--------------->S->|------->F=}->video   ^
          |  H->|  +-+        |  +-+     ^         GPU
          |->V->|->|R|        |  |R|  |->G->audio   v
          |        |A|<>|->B->|->|O|->|            ...
          |->X->|->|M|  |     |  |M|  |             ^
          |->Y->|  +-+  | fn->|  +-+  |->C->[ECU]   :
          |--------->A->|     |{=HL<--|            CPU
          |     Rx->Ei->|     |<-PC<--|->Eo->Tx     :
          |          I->|     |<-Pg<--|->O          v
          |___________________________|            ...
```

The Novasaur is a full‑featured personal computer built from fewer than three dozen Advanced Schottky TTL chips (circa 1979). It supports an 80‑column SVGA text display, PS/2 keyboard, programmable sound generator, RS232 serial, and an Intel 8080 byte‑code interpreter. The machine can run early 80's computer games and CP/M using a built‑in 252k RAM disk.

## Repository Overview

This repository contains the firmware, build tools and hardware designs for the Novasaur retro‑computer. At the root you'll find directories for build scripts, hardware CAD, documentation, fonts, libraries, sources and tests:

```
LICENSE     build/     cad/      docs/     lib/
README.md   burn_rom   fonts/    make_rom  src/
test/
```

### Key Directories

- **build/** – Ruby and AWK utilities that convert source files into Intel HEX for ROM programming. Scripts such as `asm_hex.rb` form a small assembler for the project’s custom instruction set. `make_rom` assembles all firmware and prepares a ROM image.
- **src/** – The firmware itself. Subdirectories hold BASIC programs, demos, extended opcodes, hardware drivers and the operating system.
- **docs/** – Architecture and timing diagrams (open with Draw.io).
- **fonts/** – Text versions of the PC fonts used by the video subsystem.
- **cad/** – Hardware design files including CUPL logic equations and KiCad schematics.
- **test/** – Ruby scripts for experimenting with the CPU and video/audio timing.

### Build & ROM Creation

Running `make_rom` invokes the assembler scripts on the firmware directories, combines prebuilt binaries from `lib/`, generates ALU and font data, and finally uses `minipro` to program a physical SST39SF020A chip.

### Learning Path

1. Review the assembler scripts in `build/` to understand instruction encoding and macro expansion.
2. Explore the OS sources in `src/os/` to see how the system boots and handles messages.
3. Examine the hardware schematics in `cad/` alongside the CUPL logic to learn how the CPU and GPU are implemented.
4. Read the documentation diagrams in `docs/` for big‑picture architecture and memory layout.
5. Try the simulation scripts in `test/` to become familiar with instruction execution and video/audio timing.

---

## License Info

[![License](https://img.shields.io/badge/license-GPLv3-brightgreen.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
- Copyright 2024 © Solid State Machines LLC.

The font files (TTF and FON remakes and enhancements) come from [_The Ultimate Oldschool PC Font Pack_](http://int10h.org/oldschool-pc-fonts/), copyright 2016 VileR, and licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
