SOURCES = chat.asm

all: clean chat.mon

sim: clean chat.bin
	py65mon

upload: chat.mon
	uploader_a1.py chat.mon

dump: chat.bin
	hexdump -C chat.bin

chat.mon: chat.bin
	bintomon -v -l 0x0300 -r- chat.bin >chat.mon

chat.bin: $(SOURCES)
	64tass --m6502 --nostart --output chat.bin --list chat.lst chat.asm

clean:
	$(RM) chat.bin chat.mon chat.lst 
