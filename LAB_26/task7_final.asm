
    extern
    printf
    extern scanf,gets,puts
    
section .data
    fmt1: db "Given string: ",0
    fmt2: db "Vowel: %lld Consonent: %lld",10,0
    fmt3: db "Enter a string: ",10,0
    c dq 0
    v dq 0
segment .bss
    
    str: resb 100
    
section .text

global main:
    push rbp
    mov rax,0
    mov rbx,0
    mov rcx,0
    mov rdi,fmt3
    mov rax,0
    call printf
    mov rdi, str
    mov rax,0
    call gets
    mov rcx,0
    
check:
    cmp byte[str+rcx],0
    je print
    cmp byte[str+rcx],97
    je vowel_increase
    cmp byte[str+rcx],101
    je vowel_increase
    cmp byte[str+rcx],105
    je vowel_increase
    cmp byte[str+rcx],111
    je vowel_increase
    cmp byte[str+rcx],117
    je vowel_increase
    jmp level

vowel_increase:
    add qword[v],1

level:
    inc rcx
    mov [c], rcx
    jmp check

print:
    mov rdi, fmt1
    mov rax,0
    call printf
    mov rdi, str
    mov rax,0
    call puts
    mov rdi,fmt2
    mov rsi,[v]
    sub [c], rsi
    mov rdx,[c]
    mov rax,0
    call printf
    pop rbp
    mov rax,0
    ret
