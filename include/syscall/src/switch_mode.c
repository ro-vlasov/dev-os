void switch_to_user_mode()
{
	asm volatile (" \
		cli; \
		mov $0x23,	%ax; \
		mov %ax, 	%ds; \
		mov %ax,	%es; \
		mov %ax,	%fs; \
		mov %ax,	%gs; \
		\
		mov %esp, 	%eax; \
		pushl $0x23;	\
		pushl %eax;	\
		pushf;		\
		orl $0x200, (%esp); \
		pushl $0x1B;	\
		push $1f;	\
		iret;		\
		1:		\
		");
}
