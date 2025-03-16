Firmware of RC6502 Apple1 Replica
Copyright (c) 2025 Arvid Juskaitis

Address space - $E000 - $FFFF (EPROM) 

# Entry points for different programs
$E000 - A1 Integer Basic
$F000 - FDSH (FlashDisk Shell)
$F900 - ExtLib (Common I/O routines)
$FF00 - WozMon

# Usage of ZP
All programs on this EPROM uses ZP. bss.asm defines locations of ZP, while trying to co-exist and not overlap in memory.