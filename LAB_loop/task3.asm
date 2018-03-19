extern	printf
extern scanf

section .data

a    dq 0
cnt  dq 10
size dq 0


fmt:	db	"%lld",0
fmt2:	db	"Give %lld more numbers",10,0
fmt3:	db	"Number already exists. Give %lld more numbers",10,0
fmt4:	db	"%lld",10,0
fmt5:   db  "The 10 numbers are:",10,0

segment .bss
arr resq 21

section .text

        global main
main:
    push    rbp

	mov rdi, fmt
	mov rsi, a
	mov rax, 0
	call scanf
	mov rax, [a]
	mov [arr], rax
	add qword[size], 1

	sub qword[cnt],1
	mov rdi , fmt2
	mov rsi, [cnt]
	mov rax,0
	call printf

input:
	cmp  qword[cnt],0
	je end
	mov rdi , fmt
	mov rsi , a
	mov rax , 0
	call scanf
	mov rax , [a]

	mov r8,0

check_duplicacy:

	cmp r8,[size]
	je keep

	mov rax,[arr+8*r8]

	cmp rax,[a]
	je remove

	add r8,1
	jmp check_duplicacy

remove:
	mov rdi , fmt3
	mov rsi, [cnt]
	mov rax,0
	call printf
	jmp continue

keep:

    mov rbx,[size]
	mov rax,[a]
	mov [arr+8*rbx], rax
	add qword[size], 1
	sub qword[cnt],1

	cmp qword[cnt], 0
	je end
	mov rdi , fmt2
	mov rsi, [cnt]
	mov rax,0
	call printf

continue:
	jmp input

end:
	mov rdi, fmt5
	mov rax, 0
	call printf

    mov rcx,0

print:
    cmp rcx,10
	je _exit

	mov rdi,fmt4
	mov rsi,[arr+rcx*8]
	mov rax,0
	push rcx
	call printf
	pop rcx
	add rcx,1
	jmp print

_exit:
	pop	rbp

	mov	rax,0
	ret

