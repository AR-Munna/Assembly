segment .data
    fmt: dq "Vowels: %d Consonants: %d ",10,0
    input: dq "%s ",0
    output: dq "length: %s", 10, 0

segment .bss
    s: resb 100
    b: resq 1
    c: resb 1
    d: resb 1
    len: resq 2
    cnt: resq 2

segment .text
    global main
    extern scanf
    extern gets
    extern printf

main:

    push RBP
    xor rax , rax
    ;mov rdi , input
    ;mov rsi, s
    mov rdi, s
    call gets

    mov rax, [s]
    xor rcx , rcx
    mov [cnt] ,rcx
    mov [len] , rcx
    xor rcx, rcx

char_test:

    mov [b], rcx
    mov bl, [s+rcx]
    cmp bl, 0
    jne char_test
    je print

    mov rcx, [b]
    inc rcx

print:
    mov rdi, output
    mov rsi, rax
    call printf

    pop RBP
    ret
