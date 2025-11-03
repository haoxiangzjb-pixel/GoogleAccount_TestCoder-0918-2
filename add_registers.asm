; x86汇编程序 - 使用寄存器计算和
section .data
    result_msg db 'The sum is: ', 0
    newline db 10, 0

section .bss
    result resb 4

section .text
    global _start

_start:
    ; 使用寄存器进行加法计算
    mov eax, 10      ; 将值10放入EAX寄存器
    mov ebx, 20      ; 将值20放入EBX寄存器
    add eax, ebx     ; EAX = EAX + EBX (结果为30)
    
    ; 将结果保存到内存
    mov [result], eax
    
    ; 退出程序
    mov eax, 1       ; sys_exit系统调用号
    mov ebx, 0       ; 退出状态
    int 0x80         ; 调用内核