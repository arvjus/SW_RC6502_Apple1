SOURCES = apple1.asm bss.asm \
    fdsh/defs.asm fdsh/common.asm fdsh/delay.asm fdsh/list.asm fdsh/read.asm fdsh/write.asm \
    extlib/str2uint.asm extlib/uint2str.asm extlib/ansiterm.asm extlib/conio.asm \
    wozmon/wozmon.asm 

all: basic/a1basic.bin apple1.bin 
	cp basic/a1basic.bin apple1_00.bin
	cat apple1.bin >>apple1_00.bin

basic/a1basic.bin: basic/a1basic.asm
	ca65 -l basic/a1basic.lst basic/a1basic.asm
	ld65 -m basic/a1basic.map -o basic/a1basic.bin basic/a1basic.o -C basic/a1basic.cfg

apple1.bin: $(SOURCES)
	64tass --m6502 --nostart --output apple1.bin --list apple1.lst apple1.asm
	./listaddr.py

clean:
	$(RM) basic/a1basic.bin basic/a1basic.o basic/a1basic.lst basic/a1basic.map \
	apple1.bin apple1_00.bin apple1.lst 
