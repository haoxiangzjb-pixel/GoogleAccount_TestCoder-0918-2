section .text
    global add_numbers

; Function: add_numbers
; Parameters: two integers passed in EAX and EBX registers
; Returns: sum in EAX register
add_numbers:
    add eax, ebx    ; Add the two numbers (EAX = EAX + EBX)
    ret             ; Return with result in EAX