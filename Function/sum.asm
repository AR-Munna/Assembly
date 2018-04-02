segment .data
fmt: db "%d %d", 0
fmt2: db "%d %d", 10, 0
fmt3: db "The result is: %d", 10, 0

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
mov rbp, rsp

mov rdi, fmt
mov rsi, hello
mov rdx, h2
mov rax, 0
call scanf

mov rbx, [hello]
mov rdx, [h2]

push rbx
push rdx

mov rdi, fmt3
call _sum
mov rsi, rbx
mov rax, 0
call printf

mov rax, 0
pop rbp
ret

_sum:
pop rcx
pop rdx
pop rbx

push rcx

push rbp
mov rbp, rsp

add rbx, rdx

pop rbp
ret
