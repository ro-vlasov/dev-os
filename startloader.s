    global start;		    ; The entry symbol for ELF
    extern kmain; 		    ; kmain is defined in C-file
    global __eip;
    global multiboot_spec 	    ; so we need to use it in C-code


	MBOOT_PAGE_ALIGN	equ	1<<0
	MBOOT_MEM_INFO		equ	1<<1


    	MBOOT_HEADER_MAGIC 	equ 	0x1BADB002   					; define the magic number constant
    	MBOOT_HEADER_FLAGS  	equ 	(MBOOT_PAGE_ALIGN|MBOOT_MEM_INFO)		; multiboot flags
    	MBOOT_CHECKSUM     	equ 	-( MBOOT_HEADER_MAGIC + MBOOT_HEADER_FLAGS) 	; calculate the checksum
                            ; (magic number + checksum + flags should equal 0)
    	

	KERNEL_STACK_SIZE equ 0x2000    						; size of stack in bytes
    
section ._mbHeader
    	align 4
    multiboot_spec:
	dd MBOOT_HEADER_MAGIC
	dd MBOOT_HEADER_FLAGS
	dd MBOOT_CHECKSUM
	dd multiboot_spec

section .text
    start:				; the loader label (defined as entry point in linker script)    
	mov	esp, kernel_stack + KERNEL_STACK_SIZE    
        push    ebp 
        push	esp			; push into the stack the address of the structure recieved from the loader

        call kmain  
	hlt

    __eip:
	pop	eax
	jmp	eax


    
section .bss
    align 4                                     ; align at 4 bytes
    kernel_stack:                               ; label points to beginning of memory
        resb KERNEL_STACK_SIZE                  ; reserve stack for the kernel



 
