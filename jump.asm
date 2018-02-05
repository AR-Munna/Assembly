segment .data
fmt: db "%d %d", 0
fmt2: db "The result is: %d", 10, 0
fmt3: db "The smallest is: %d", 10, 0
fmt4: db "The biggest is: %d", 10, 0

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
mov rdx, h2
mov rax, 0
call scanf

mov rax, [hello]
mov rbx, [h2]
cmp rax, rbx
je smallest
jne biggest

smallest:
mov rdi, fmt3
mov rbx, [hello]
mov rsi, rbx
mov rax, 0
call printf
jmp exit

biggest:
mov rdi, fmt4
mov rbx, [h2]
mov rsi, rbx
mov rax, 0
call printf

exit:

mov rax, 0
pop rbp
ret

