format ELF64 executable

macro write fd, buf, count 
{
    mov rax, 1
    mov rdi, fd
    mov rsi, buf
    mov rdx, count
    syscall
}

macro exit status 
{
    mov rax, 60
    mov rdi, status
    syscall
}

segment readable executable
entry main
main:
    write 1, msg, msg_len
    exit 0

segment readable writeable
msg: db "Hello, world!", 10
msg_len = $ - msg
