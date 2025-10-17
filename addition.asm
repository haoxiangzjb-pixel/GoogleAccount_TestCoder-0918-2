section .text
    global _start

_start:
    ; 将两个数字加载到寄存器中
    mov eax, 10      ; 将数字10放入EAX寄存器
    mov ebx, 20      ; 将数字20放入EBX寄存器
    
    ; 计算和
    add eax, ebx     ; EAX = EAX + EBX (结果为30)
    
    ; 退出程序，将结果作为退出码
    mov eax, 1       ; sys_exit系统调用号
    int 0x80         ; 调用内核