segment .data
    print: dq "%d ",10,0
    input: dq "%d",0
    p: dq "*", 10, 0

segment .bss
    ar: resq 255
    b: resq 2
    c: resq 2
    d: resq 2

segment .text
    global main
    extern printf
    extern scanf

main:
    push RBP

    xor rcx, rcx
    mov [c] , rcx
level1:
    mov rbx , rcx
    mov [b], rcx
    xor rax, rax
    mov rdi , input
    mov rsi, d
    call scanf

    mov rax , [d]
    mov [ar+rbx*8],rax

    xor rax , rax

    mov [c], rax
    mov rcx , [b]

    INC rcx
    cmp rcx , 5
    jne level1

    xor rcx, rcx

level2:
    mov [b] , rcx
    xor rax , rax
    mov rdx, 0
    mov rax , [ar+rcx*8]
    mov rbx, 2
    div rbx
    mov r8, 0
    cmp rdx, r8
    jne level3

    mov rdi, p
    call printf

    mov rcx, [b]
    INC rcx
    cmp rcx , 5
    jne level2

    pop RBP
    ret

level3:
    mov rdi , print
    mov rsi, [ar+rcx*8]
    call printf
    pop rbp
    ret

