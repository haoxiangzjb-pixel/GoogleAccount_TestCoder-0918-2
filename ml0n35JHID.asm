.section .data
    hello_msg: .ascii "Hello
"
    msg_len = . - hello_msg

.section .text
    .global _start

_start:
    # write system call
    mov $1, %rax        # sys_write
    mov $1, %rdi        # stdout
    mov $hello_msg, %rsi # message to write
    mov $msg_len, %rdx    # message length
    syscall

    # exit system call
    mov $60, %rax       # sys_exit
    mov $0, %rdi        # exit status
    syscall
