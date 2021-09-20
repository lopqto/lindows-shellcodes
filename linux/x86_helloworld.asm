format ELF executable

segment readable executable

entry start

start:
    
    mov     eax, 4 ; syscall ssize_t write(int fd, const void *buf, size_t count);
    mov     ebx, 1 ; fd stdout
    mov     ecx, msg ; buffer contains our message
    mov     edx, msg_len ; message length
    int     0x80 ; invoke syscall

    mov     eax, 1 ; syscall exit
    xor     ebx, ebx ; zero out the ebx register => exit(0)
    int     0x80 ; invoke syscall

segment readable writeable

msg     db 'Hello World!', 0xA ; Hello World\n
msg_len = $-msg ; calculate message length