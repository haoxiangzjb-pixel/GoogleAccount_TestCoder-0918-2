section .text
    global add_numbers

; Function: add_numbers
; Takes two integer arguments and returns their sum
; For x86-64, first argument is in RDI, second in RSI, result in RAX
add_numbers:
    mov rax, rdi    ; Move first argument to RAX
    add rax, rsi    ; Add second argument to RAX
    ret             ; Return with result in RAX