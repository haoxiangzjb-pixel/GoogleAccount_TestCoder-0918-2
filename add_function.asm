section .text
    global add_numbers

; Function: add_numbers
; Parameters: two integers passed in eax and ebx
; Returns: sum in eax
add_numbers:
    add eax, ebx      ; Add ebx to eax
    ret               ; Return with result in eax