section .text
    global _start

; Функция для сложения двух чисел
; Принимает два аргумента: num1 в EAX, num2 в EBX
; Возвращает результат в EAX
add_numbers:
    add eax, ebx    ; Складываем EBX к EAX
    ret             ; Возвращаемся

_start:
    ; Загружаем числа для сложения
    mov eax, 5      ; num1 = 5
    mov ebx, 10     ; num2 = 10

    ; Вызываем функцию сложения
    call add_numbers

    ; Результат теперь в EAX (должен быть 15)

    ; Выход из программы
    mov ebx, 0      ; Exit status
    mov eax, 1      ; Exit syscall number
    int 0x80        ; Вызов системной функции