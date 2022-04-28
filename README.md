# My OS
## About
I wanted to learn about kernel design and the creation of operating systems, so I followed some tutorials from the OSDevWiki.

Currently, the kernel is extremely minimal and can only display text on the screen through VGA.

## Compile and Run
In order to compile, a gcc cross-compiler must be set up for i686-elf. Then:
To Compile:
First, assemble the bootloader:
```
i686-elf-as boot.s -o boot.o
```
Second, compile the kernel:
```
i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
```
Third, link the two:
```
i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
```

To check if the OS is bootable, run:
```
grub-file --is-x86-multiboot myos.bin
echo $?
```
If the output is 0, the multiboot is working. If the output is 1, there was an error.

To Run:
Make a bootable iso:
```
mkdir -p isodir/boot/grub
cp myos.bin isodir/boot/myos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o myos.iso isodir
```

Run the iso using qemu:
```
qemu-system-i386 -cdrom myos.iso
```
