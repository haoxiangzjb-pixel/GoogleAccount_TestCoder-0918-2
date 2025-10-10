section .text
global _start

; Функция: add_numbers
; Вход: EAX = первое число, EBX = второе число
; Выход: EAX = сумма
add_numbers:
    add eax, ebx
    ret

; Пример использования в _start для тестирования
_start:
    mov eax, 5      ; Загружаем первое число в EAX
    mov ebx, 3      ; Загружаем второе число в EBX
    call add_numbers ; Вызываем функцию сложения

    ; Результат (8) теперь в EAX
    ; Выход из программы
    mov ebx, 0      ; Код возврата
    mov eax, 1      ; Системный вызов exit
    int 0x80        ; Вызов ядра