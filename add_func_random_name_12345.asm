section .text
global add_numbers
add_numbers:
    ; Функция принимает два 32-битных целых числа в eax и ebx, возвращает сумму в eax
    add eax, ebx
    ret