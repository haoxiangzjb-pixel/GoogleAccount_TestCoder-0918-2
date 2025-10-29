; x86汇编程序 - 计算两个数的和
section .data
    num1 dd 10          ; 第一个数
    num2 dd 20          ; 第二个数
    result dd 0         ; 存储结果

section .text
    global _start

_start:
    ; 将两个数加载到寄存器中并计算和
    mov eax, [num1]     ; 将num1的值加载到eax寄存器
    mov ebx, [num2]     ; 将num2的值加载到ebx寄存器
    add eax, ebx        ; eax = eax + ebx (计算和)
    mov [result], eax   ; 将结果保存到result变量

    ; 退出程序
    mov eax, 1          ; sys_exit系统调用号
    mov ebx, 0          ; 退出状态
    int 0x80            ; 调用内核