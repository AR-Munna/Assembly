segment .data
    print: dq "index: %d ",10,0
    input: dq "%d",0
    notfound: dq "not found", 10, 0

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
    mov rcx , [b]
    INC rcx
    cmp rcx , 5
    jne level1

found:
    mov rdi, input
    mov rsi, d
    call scanf
    mov rax, [d]

    mov rbx, [ar+rax*8]
    mov rdi, print
    mov rsi, rbx
    call printf
    pop rbp
    ret

;another:
    ;mov rdi, input
    ;mov rsi, d
    ;call scanf
    ;mov rax, [d]

    ;mov rbx, [ar+rax*8]
    ;mov rdi, print
    ;mov rsi, rax
    ;call printf
    ;pop rbp
    ;ret





