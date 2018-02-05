segment .data
fmt: db "%d", 0
fmt2: db "ODD", 10, 0
fmt3: db "EVEN", 10, 0
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
call input
push rbp

input:
mov rdi, fmt
mov rsi, hello
mov rax, 0
call scanf

division:
mov rdi, fmt4
mov rdx, 0
mov rax, [hello]
mov rbx, 2
div rbx
mov rsi, rdx
mov rcx, 1
cmp rsi, rcx
je odd
jne even1
jmp exit

odd:
mov rdi, fmt2
mov rax, 0
call printf
jmp exit

even1:
mov rdi, fmt3
mov rsi, rax
mov rax, 0
call printf
jmp exit

exit:

mov rax, 0
pop rbp
ret

