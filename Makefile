.PHONY: bin iso all clean clean_the_rest clean_all

all: bin iso

clean_all: clean clean_the_rest

bin:
	@echo "Assembling bootstrap loader..."
	i686-elf-as boot.s -o boot.o
	@echo "Done assembling\nCompiling kernel..."
	i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
	@echo "Done compiling\nLinking..."
	i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
	@echo "Done Linking\nBin ready."

iso:
	@echo "Creating directory"
	mkdir -p isodir/boot/grub
	@echo "Updating isodir directory"
	cp myos.bin isodir/boot/myos.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	@echo "Creating ISO"
	grub-mkrescue -o myos.iso isodir
	@echo "ISO Complete"

clean:
	@echo "Cleaning up..."
	rm boot.o
	rm kernel.o
	rm myos.bin
	rm -rf isodir
	@echo "Cleanup complete"

clean_the_rest:
	rm myos.iso
