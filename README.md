# Novasaur
Retrocomputer built from late-70's TTL logic chips
```
                                                   ...
          |--------------->S->|------->F=}->video   ^
          |  H->|  +-+        |  +-+     ^         GPU
          |->V->|->|R|        |  |R|  |->G->audio   v
          |        |A|<>|->b->|->|O|->|            ...
          |->X->|->|M|  |     |  |M|  |->C->[ECU]   ^
          |->Y->|  +-+  | fn->|  +-+  |             :
          |             |     |{=HL<--|             :
          |             |     |<-PC<--|            CPU
          |             |     |<-Pg<--|             :
          |     Rx->Ei->|<----A<------|->Eo->Tx     :
          |<--------------------------|<---->I/O    v
                                                   ...
```
Can you browse the Web using pre-1980 TTL logic and memory speeds? The goal of this project is to demonstrate how. Internet connectivity is via an era-appropriate RS232 interface. The machine is upward compatible by a decade to support currently available keyboard and video interfaces (PS/2 and VGA). The video includes a native text mode capable of displaying 104-columns and bitmapped color graphics for retro gaming.

---

## License Info

[![License](https://img.shields.io/badge/license-GPLv3-brightgreen.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
- Copyright 2020 © Alastair Hewitt.

The font files (TTF and FON remakes and enhancements) come from [_The Ultimate Oldschool PC Font Pack_](http://int10h.org/oldschool-pc-fonts/), copyright 2016 VileR, and licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
