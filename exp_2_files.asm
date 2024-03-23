extern print_number
section .text
global _start
_start:
    mov rax, 70
    call print_number

    mov rax, 60
    mov rdi, 0
    syscall
