.section .text
.global add_numbers

# Function to add two numbers
# Takes two integer arguments in %rdi and %rsi (first and second)
# Returns the sum in %rax
add_numbers:
    movq %rdi, %rax    # Move first argument to %rax
    addq %rsi, %rax    # Add second argument to %rax
    ret                # Return with result in %rax