# YATAC78
Retro computer built from 1978-era TTL logic chips
```
                                                         ...
          |--------------->SC->|------->C=}->video        ^
          |  H->|  +-+         |  +-+     ^              GPU
          |->V->|->|R|->|->gc->|->|R|  |->G->audio        v
          |        |A|            |O|->|                 ...
          |     |->|M|<>|->cc->|->|M|  |     +-+          ^
          |->Y->|  +-+  |  fn->|  +-+  | ck->|E|          :
          |->X->|------>|      |{=HL<--|->I->|C|          :
          |             |      |<-PC<--|  +->|U|         CPU
          |             |      |<-Pg<--|  |  +-+          :
          | serial->Ei->|<-A<----------|->Eo->serial      :
          |<---------------------------|->Expansion       v
                                                         ...
```
Can you browse the Web using pre-1980 TTL logic and memory speeds? The goal of this project is to demonstrate how. Internet connectivity is via an era-appropriate RS232 interface. The machine is upward compatible by a decade to support currently available keyboard and video interfaces (PS/2 and VGA). The video includes a native text mode capable of displaying 96-columns and two bitmapped color graphics modes for retro gaming.

---

## License Info

[![License](https://img.shields.io/badge/license-GPLv3-brightgreen.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
- Copyright 2019 © Alastair Hewitt.

The font files (TTF and FON remakes and enhancements) come from [_The Ultimate Oldschool PC Font Pack_](http://int10h.org/oldschool-pc-fonts/), copyright 2016 VileR, and licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
