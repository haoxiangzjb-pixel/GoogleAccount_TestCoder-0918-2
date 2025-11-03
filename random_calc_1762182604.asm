; x86汇编程序 - 计算两个数的和并保存到内存
section .data
    num1 dd 10          ; 第一个数
    num2 dd 20          ; 第二个数
    result dd 0         ; 存储结果

section .text
    global _start

_start:
    ; 将两个数加载到寄存器中
    mov eax, [num1]     ; 将num1的值加载到EAX寄存器
    mov ebx, [num2]     ; 将num2的值加载到EBX寄存器
    
    ; 计算和
    add eax, ebx        ; EAX = EAX + EBX
    
    ; 将结果保存到内存
    mov [result], eax   ; 将EAX寄存器的值保存到result变量
    
    ; 程序退出
    mov eax, 1          ; sys_exit系统调用号
    xor ebx, ebx        ; 退出状态码
    int 0x80            ; 调用内核