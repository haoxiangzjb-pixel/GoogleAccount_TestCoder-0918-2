section .data
    num1 dd 10          ; 第一个数字
    num2 dd 20          ; 第二个数字
    result dd 0         ; 存储结果

section .text
    global _start

_start:
    ; 将两个数字加载到寄存器中
    mov eax, [num1]     ; 将num1的值加载到EAX寄存器
    mov ebx, [num2]     ; 将num2的值加载到EBX寄存器
    
    ; 计算和
    add eax, ebx        ; EAX = EAX + EBX
    
    ; 将结果存储到内存
    mov [result], eax   ; 将EAX的值存储到result位置
    
    ; 退出程序
    mov eax, 1          ; sys_exit系统调用号
    xor ebx, ebx        ; 退出状态码
    int 0x80            ; 调用系统中断