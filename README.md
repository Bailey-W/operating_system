# My OS
## About
I wanted to learn about kernel design and the creation of operating systems, so I followed some tutorials from the OSDevWiki.

Currently, the kernel is extremely minimal and can only display text on the screen through VGA.

## Compile and Run
In order to compile, a gcc cross-compiler must be set up for i686-elf. Then:
To Compile:
```
make bin
```

To make ISO:
```
make iso
```

To do both at once:
```
make all
```

Run the iso using qemu:
```
qemu-system-i386 -cdrom myos.iso
```

## Cleanup
To cleanup unnecessary files but leave the ISO, run:
```
make clean
```
To remove all generated files including the ISO, run:
```
make clean_all
```
