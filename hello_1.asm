section .data
    hello db 'Hello', 0

section .text
    global _start

_start:
    ; write syscall
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello      ; message to write
    mov edx, 5          ; message length
    int 0x80            ; call kernel

    ; exit syscall
    mov eax, 1          ; syscall number for sys_exit
    mov ebx, 0          ; exit status
    int 0x80            ; call kernel