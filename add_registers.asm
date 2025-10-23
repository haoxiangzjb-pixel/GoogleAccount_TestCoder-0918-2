section .data
    num1 dd 15          ; 第一个数
    num2 dd 25          ; 第二个数

section .text
    global _start

_start:
    ; 将两个数加载到寄存器中
    mov eax, [num1]     ; 将num1的值加载到eax寄存器
    mov ebx, [num2]     ; 将num2的值加载到ebx寄存器
    
    ; 计算和
    add eax, ebx        ; eax = eax + ebx
    
    ; 结果现在存储在eax寄存器中
    
    ; 退出程序
    mov ebx, 0          ; 退出状态码
    mov eax, 1          ; 系统调用号 (sys_exit)
    int 0x80            ; 调用内核