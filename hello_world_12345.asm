section .data
    hello db 'Hello', 0

section .text
    global _start

_start:
    ; write syscall
    mov rax, 1          ; syscall number for write
    mov rdi, 1          ; file descriptor 1 (stdout)
    mov rsi, hello      ; message to write
    mov rdx, 5          ; length of the message
    syscall

    ; exit syscall
    mov rax, 60         ; syscall number for exit
    mov rdi, 0          ; exit status
    syscall