; x86 Assembly program to calculate sum of registers
; This program calculates the sum of EAX, EBX, ECX, and EDX registers

section .data
    result_msg db 'Sum of registers: ', 0
    newline db 10, 0

section .bss
    result resb 10

section .text
    global _start

_start:
    ; Initialize registers with some values
    mov eax, 10      ; EAX = 10
    mov ebx, 20      ; EBX = 20
    mov ecx, 30      ; ECX = 30
    mov edx, 40      ; EDX = 40

    ; Calculate sum of all registers
    push eax         ; Save original EAX
    add eax, ebx     ; EAX = EAX + EBX = 10 + 20 = 30
    add eax, ecx     ; EAX = EAX + ECX = 30 + 30 = 60
    add eax, edx     ; EAX = EAX + EDX = 60 + 40 = 100
    ; Now EAX contains the sum (100)

    ; Prepare for exit
    ; In x86-32 Linux, system call for exit is:
    ; syscall number 1, EAX = sum of registers
    mov ebx, eax     ; Move sum to EBX as exit status
    mov eax, 1       ; sys_exit system call number
    int 0x80         ; Call kernel