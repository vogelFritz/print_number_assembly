section .text
global _start
_start:
    ; Prologue: Allocate space for local variables on the stack
    push rbp        ; Save the base pointer
    mov rbp, rsp    ; Set the base pointer to the current stack pointer

    ; Allocate space for local variables
    sub rsp, 12      ; int firstVal, secondVal and currentFib => 4 * 3 = 12 bytes

    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    mov rax, 458 ; number to print (parameter)
    call print_number
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx

    ; Epilogue: Restore the stack pointer and base pointer
    mov rsp, rbp    ; Restore the stack pointer
    pop rbp         ; Restore the base pointer

    jmp end_program

; Parameters:
; rax: Number to print
print_number:
    ; Prologue: Allocate space for local variables on the stack
    push rbp        ; Save the base pointer
    mov rbp, rsp    ; Set the base pointer to the current stack pointer

    ; Allocate space for local variables
    sub rsp, 12      ; numberstr variable: 10 digit (max) number string (2 bytes for endl and \0)

    xor rsi, rsi
    shl rsi, 8
    mov sil, 10
    shl rsi, 8

    push rax
    call get_ascii_digits_loop
    
    mov qword [rbp - 12], rsi

    ; Print resulting string
    mov rax, 1 ; sys_write
    mov rdi, 1 ; stdout
    lea rsi, [rbp - 12] ; message to write
    mov rdx, 12 ;message length
    syscall

    pop rax
    ; Epilogue: Restore the stack pointer and base pointer
    mov rsp, rbp    ; Restore the stack pointer
    pop rbp         ; Restore the base pointer
    ret

; Loop for print_number
get_ascii_digits_loop:
    ; Setup
    mov rcx, 10 ; String result index
    mov ebx, 10 ; Divisor
main_loop:
    xor rdx, rdx ; clear rdx for some reason
    div ebx ; eax = eax / ebx and edx = eax % ebx
    add edx, 48 ; convert edx (1 digit) int to char

    sub rbp, rcx
    mov sil, dl ; Store char
    shl rsi, 8 
    add rbp, rcx

    sub ecx, 1 ; Decrement index (to store next char)
    ; Check if loop is over (ecx == 0 || eax == 0)
    test eax, eax ; If eax contains zero end loop
    jz end_main_loop
    test ecx, ecx ; If ecx contains zero end loop
    jz end_main_loop
    jmp main_loop ; Repeat

end_main_loop:
    ret

end_program:
    mov rax, 60
    mov rdi, 0
    syscall