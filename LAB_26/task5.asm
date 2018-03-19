segment .data
    fmt: dq "Smallest number: %d -> at index: %d &&",10,0
    fmt1: dq "Largest number is: %d -> at index: %d ",10,0
    input: dq "%d",0


segment .bss
    a: resq 255
    b: resq 1
    c: resq 1
    d: resq 1
    in: resq 1
    val: resq 1

segment .text
    global main
    extern printf
    extern scanf

main:
    push RBP
    xor rcx, rcx
    mov rdx, 100

input_level:
    mov rbx , rcx
    mov [b], rcx
    xor rax, rax
    mov rdi , input
    mov rsi, d
    call scanf
    mov rax , [d]
    mov [a+rbx*8],rax
    mov rcx , [b]
    INC rcx
    cmp rcx , 5
    jne input_level

    xor rbx , rbx
    xor rcx, rcx

smallest:

    mov rbx, [a+rcx*8]
    cmp rbx, rdx
    jg sm1
    mov rdx, rbx

sm1:
    mov [in], rcx
    inc rcx
    cmp rcx, 5
    jne smallest

    ;mov [in], rcx
    mov [val], rdx

    mov rdi, fmt
    mov rsi, [val]
    mov rdx, [in]
    call printf

    xor rcx, rcx
    mov rdx, 0

largest:
    mov rbx, [a+rcx*8]
    cmp rbx, rdx
    jl lg1
    mov rdx, rbx
    mov [in], rcx

lg1:

    inc rcx
    cmp rcx, 5
    jne largest

    ;mov [in], rcx
    mov [val], rdx

    mov rdi, fmt1
    mov rsi, [val]
    mov rdx, [in]
    call printf
