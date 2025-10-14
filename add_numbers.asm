section .text
    global _start

_start:
    ; Загружаем два числа в регистры
    mov eax, 5      ; Первое число
    mov ebx, 3      ; Второе число

    ; Складываем числа
    add eax, ebx    ; Результат сложения в eax

    ; Выход из программы
    mov ebx, 0      ; Код возврата
    mov eax, 1      ; Системный вызов exit
    int 0x80        ; Вызов ядра