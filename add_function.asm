section .text
    global add_numbers

; Function: add_numbers
; Parameters: two integers passed in EAX and EDX registers
; Returns: sum in EAX register
add_numbers:
    add eax, edx      ; Add the values in EAX and EDX, result in EAX
    ret               ; Return to caller