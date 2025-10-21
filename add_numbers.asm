section .text
    global add_numbers

; Function to add two numbers
; Receives two integers as parameters and returns their sum
add_numbers:
    ; Function prologue
    push ebp
    mov ebp, esp

    ; Load the two parameters from the stack
    ; [ebp+8] is the first parameter
    ; [ebp+12] is the second parameter
    mov eax, [ebp+8]      ; Load first number into eax
    mov ebx, [ebp+12]     ; Load second number into ebx
    add eax, ebx          ; Add the two numbers, result in eax

    ; Function epilogue
    mov esp, ebp
    pop ebp
    ret                   ; Return with result in eax