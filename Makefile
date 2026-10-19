CC65 = /usr/local/bin/cc65
CA65 = /usr/local/bin/ca65
LD65 = /usr/local/bin/ld65

NAME = hello

CFG = nrom_32k_vert.cfg

.PHONY: default clean

default: $(NAME).nes

$(NAME).nes: $(NAME).o crt0.o $(CFG)
	$(LD65) -C $(CFG) -o $(NAME).nes crt0.o $(NAME).o nes.lib -Ln labels.txt --dbgfile dbg.txt
	rm *.o
	@echo $(NAME).nes created

crt0.o: crt0.s Alpha.chr
	$(CA65) crt0.s

$(NAME).o: $(NAME).s
	$(CA65) $(NAME).s -g

$(NAME).s: $(NAME).c
	$(CC65) -Oirs $(NAME).c --add-source -Iinclude

clean:
	rm $(NAME).nes
