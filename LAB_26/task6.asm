segment .data
    fmt: dq "%d ",10,0
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

outer1:
    mov [b] , rbx
    xor rcx , rcx

inner1:
    mov [c] , rcx

    mov rbx , [b]
    mov rcx , [c]
    mov rax , [a+rbx*8]
    mov rdx , [a+rcx*8]

    cmp rax , rdx
    jg inner1_con

    mov rbx , [b]
    mov rcx , [c]
    mov rax , [a+rbx*8]
    mov rdx , [a+rcx*8]

    mov [a+rbx*8] , rdx
    mov [a+rcx*8] , rax

inner1_con:
    mov rcx , [c]
    INC rcx
    cmp rcx , 5
    jne inner1

first_con:
    mov rbx , [b]
    INC rbx
    cmp rbx , 5
    jne outer1

    xor rcx , rcx

print:
    mov [d] , rcx
    xor rax , rax
    mov rdi , fmt
    mov rsi , [a+rcx*8]
    call printf

    mov rcx , [d]
    INC rcx
    cmp rcx , 5
    jne print

    pop RBP
    ret
