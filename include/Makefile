
CC = gcc
CFLAGS = -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector \
             -nostartfiles -nodefaultlibs -Wall -Wextra  -c
AS = nasm
ASFLAGS = -f elf32

%.o: %.c
	$(CC) $(CFLAGS)  $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

DIR1 = desc_tables 
DIR2 = memory_management
DIR3 = heap
DIR4 = multitasking
DIR5 = fs
DIR5 = syscall

run:	
	$(MAKE) -C $(DIR1)
	$(MAKE) -C $(DIR2)
	$(MAKE) -C $(DIR3)
	$(MAKE) -C $(DIR4)
	$(MAKE) -C $(DIR5)
	mv *.o ..


	

