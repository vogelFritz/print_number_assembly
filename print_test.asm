section .bss
    number: resb 4
section .data
    helloworld: db "Hello, World!", 10, 0
    msgLen: equ $-helloworld
section .text
global _start
_start:
    xor rax, rax
    shl rax, 8
    mov al, 10
    shl rax, 8
    mov al, '3'
    shl rax, 8
    mov al, '5'
    mov dword [number], eax

    mov rax, 1 ; sys_write
    mov rdi, 1 ; stdout
    lea rsi, number ; message to write
    mov rdx, 4 ;message length
    syscall

    jmp end_program
end_program:
    mov rax, 60
    mov rdi, 0
    syscall