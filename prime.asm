segment .data
fmt: db "%d", 0
fmt2: db "not prime", 10, 0
fmt3: db "prime", 10, 0
fmt4: db "The result is: %d  and the remainder: %d", 10, 0

segment .bss
hello: resq 1
h2: resq 1
sum: resq 1

segment .text

global main
extern scanf
extern printf

main:

push rbp

mov rdi, fmt
mov rsi, hello
mov rax, 0
call scanf

mov rax, 1
mov rcx, [hello]
sub rcx, 1


pr10:
inc rax
mov rdi, fmt4
mov rsi, rax
push rax
push rcx

;mov rdi, fmt4
mov rdx, 0

mov rbx, rax
mov rax, [hello]
div rbx
cmp rdx, 0

pop rcx
pop rax
je notprime


dec rcx
cmp rcx, 0
je pr10


prime:
mov rdi, fmt3
mov rax, 0
call printf
jmp exit

notprime:
mov rdi, fmt2
mov rax, 0
call printf
jmp exit

exit:

mov rax, 0
pop rbp
ret


