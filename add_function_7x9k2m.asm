.section .text
.global add_numbers

# Function: add_numbers
# Parameters: Two integers in registers %rdi and %rsi
# Returns: Sum in register %rax
add_numbers:
    movq    %rdi, %rax    # Move first argument to %rax
    addq    %rsi, %rax    # Add second argument to %rax
    ret                   # Return with sum in %rax