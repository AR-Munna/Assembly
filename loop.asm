segment .data
fmt: db "%d", 10, 0
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
push rbp

xor rax, rax
mov rcx, 1000

pr10:
inc rax
mov rdi, fmt
mov rsi, rax
push rax
push rcx
mov rax, 0
call printf
pop rcx
pop rax
loop pr10

mov rax, 0
pop rbp
ret

