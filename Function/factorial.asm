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
    mov rax, 0
    call scanf

    mov rbx, [hello]
    push rbx

    mov rax, 1
    call _func

    mov rdi, fmt3
    mov rsi, rax
    mov rax, 0
    call printf

    mov rax, 0
    leave
    ret

_func:
    push rbp
    mov rbp, rsp


    mov rbx, [rbp+16]
    dec rbx
    cmp rbx, 0
    jz level
    push rbx
    call _func

level:
    mov rbx, [rbp+16]
    mul rbx
    leave
    ret
