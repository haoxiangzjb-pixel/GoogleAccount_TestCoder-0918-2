; x86汇编程序 - 使用寄存器计算和 (随机命名文件)
section .data
    ; 数据段（可选）
    msg db 'Calculating sum using registers...', 10, 0

section .text
    global _start

_start:
    ; 初始化寄存器值
    mov eax, 5       ; 将值5放入EAX寄存器
    mov ebx, 15      ; 将值15放入EBX寄存器
    mov ecx, 10      ; 将值10放入ECX寄存器
    
    ; 计算和 (EAX + EBX + ECX)
    add eax, ebx     ; EAX = EAX + EBX = 5 + 15 = 20
    add eax, ecx     ; EAX = EAX + ECX = 20 + 10 = 30
    
    ; 最终结果存储在EAX寄存器中 (EAX = 30)
    
    ; 退出程序
    mov eax, 1       ; sys_exit系统调用号
    mov ebx, 0       ; 退出状态
    int 0x80         ; 调用内核