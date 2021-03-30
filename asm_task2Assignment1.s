section	.rodata			; we define (global) read-only variaebxes in .rodata section
	format_string: db "%s", 10, 0
	check: db "in here", 10, 0	; format string

section .bss			; we define (global) uninitialized variaebxes in .bss section
	an: resb 12		; enough to store integer in [-2,147,483,648 (-2^31) : 2,147,483,647 (2^31-1)]

section .text
	global convertor
	extern printf

convertor:
	push ebp
	mov ebp, esp	
	pushad			

	mov ecx, dword [ebp+8]	; get function argument (pointer to string)

	mov dword eax, 0
	mov dword edx, 0

	loop:
		cmp dword [ecx], '\n'
		jmp end_loop
		mov dword ebx, 0
		mov ebx, [ecx]
		cmp dword ebx, 'A'     ; check if the character is less than 'A'
        jb digits                ; if it does, jump to the end

	letters:
		sub dword ebx, 'A'
		add dword ebx, 10
		jmp end_loop

	digits:
		sub dword ebx, '0'

	end_loop:
		inc edx
		add dword eax, ebx
		shl eax, 4
		inc ecx
		cmp byte [ecx], 0
		jnz loop
	
	mov ecx, 0
	shl dword edx, 2
	
	ascii_con:
		shl eax, 1
		setc byte [ecx]
		add byte [ecx], "0"
		inc ecx
		dec edx
		cmp dword [edx], 0
		jnz ascii_con


	mov dword [an], ecx
	push an		; call printf with 2 arguments -  
	push format_string	; pointer to str and pointer to format string
	call printf
	add esp, 8		; clean up stack after call

	popad			
	mov esp, ebp	
	pop ebp
	ret
