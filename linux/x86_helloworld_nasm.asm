section .text
    global _start

_start:
    mov     eax, 4 ; syscall ssize_t write(int fd, const void *buf, size_t count);
    mov     ebx, 1 ; fd stdout
    mov     ecx, msg ; buffer contains our message
    mov     edx, msg_len ; message length
    int     0x80 ; invoke syscall

    mov     eax, 1 ; syscall exit
    xor     ebx, ebx ; zero out the ebx register => exit(0)
    int     0x80 ; invoke syscall

section .data
    msg:      db 'Hello World!', 0xA
    msg_len:  equ $-msg