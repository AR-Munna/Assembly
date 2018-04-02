segment .data
    fmt: db "%d", 0
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
    mov rdx, 1

    jmp fact

fact:
    mov rax, rbx
    mul rdx
    mov rdx, rax

    sub rbx, 1
    cmp rbx, 0
    jne fact

    mov rdi, fmt3
    mov rsi, rax
    mov rax, 0
    call printf

    pop rbp
    ret


