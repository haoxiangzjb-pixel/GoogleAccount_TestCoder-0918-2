section .data
    hello db 'Hello', 0

section .text
    global _start

_start:
    ; write syscall
    mov rax, 1        ; syscall number for sys_write
    mov rdi, 1        ; file descriptor (stdout)
    mov rsi, hello    ; message to write
    mov rdx, 5        ; number of bytes to write
    syscall

    ; exit syscall
    mov rax, 60       ; syscall number for sys_exit
    mov rdi, 0        ; exit status
    syscall