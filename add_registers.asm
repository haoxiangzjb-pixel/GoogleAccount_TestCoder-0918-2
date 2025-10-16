; x86汇编程序：使用寄存器计算和

section .data
    num1 dd 10          ; 第一个数字
    num2 dd 20          ; 第二个数字
    result dd 0         ; 存储结果

section .text
    global _start

_start:
    ; 将数字加载到寄存器中
    mov eax, [num1]     ; 将num1的值加载到eax寄存器
    mov ebx, [num2]     ; 将num2的值加载到ebx寄存器
    
    ; 计算和
    add eax, ebx        ; eax = eax + ebx
    
    ; 将结果存储到内存
    mov [result], eax   ; 将结果存储到result变量
    
    ; 程序退出
    mov eax, 1          ; sys_exit系统调用号
    xor ebx, ebx        ; 退出状态码
    int 0x80            ; 调用内核