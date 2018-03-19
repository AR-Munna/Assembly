extern	printf
extern scanf,gets,puts

section .data

fmt1: db "Given string: ",0
fmt2: db "Not Palindrome",10,0
fmt3: db "Palindrome",10,0

c dq 0
v dq 0


segment .bss
p: resb 100
q: resb 100


section .text
        global main
main:
    push    rbp

	mov rax,0
	mov rbx,0
	mov rcx,0

	mov rdi, p
	mov rax,0
	call gets

	mov rax, [p]
	mov [q], rax
    mov rcx, 0

length:
    inc rcx
    mov al, [p+rcx]
    cmp al, 0
    jne length

	mov rax, rcx
	mov rbx, rax
	mov rdx, 2
	div rdx
	mov rdx, rax
	mov rcx, 0


check:
    mov al, [p+rcx]
    mov bl, [q+rbx]

    cmp al, bl
    jnz print

	jmp level

level:
	inc rcx
	mov [c], rcx
	dec rbx

	cmp rcx, rax
    je equal

	jmp check

equal:
    mov rdi, fmt3
	mov rax,0
	call printf

	pop	rbp
	mov	rax,0
	ret

print:

	mov rdi, fmt2
	mov rax,0
	call printf

	pop	rbp
	mov	rax,0
	ret


