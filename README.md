# Novasaur
Retrocomputer built from late-70's TTL logic chips
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

The Novasaur is a full-featured personal computer built from less than three dozen Advanced Schottky TTL chips (circa 1979). It supports an 80-column SVGA text display, PS/2 keyboard, programmable sound generator, RS232 serial, and an Intel 8080 byte-code interpreter. The machine is capable of running early 80's computer games and CP/M using a built-in 250k RAM disk.

---

## License Info

[![License](https://img.shields.io/badge/license-GPLv3-brightgreen.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
- Copyright 2021 © Alastair Hewitt.

The font files (TTF and FON remakes and enhancements) come from [_The Ultimate Oldschool PC Font Pack_](http://int10h.org/oldschool-pc-fonts/), copyright 2016 VileR, and licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
