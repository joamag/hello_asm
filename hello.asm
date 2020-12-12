section .data
    hello:      db      "Hello, world!", 10
    hello.len:  equ     $ - hello
    counter:    db      00h

section .text
    global _start 

_start:
    mov ecx, counter
    mov eax, 4           ; 'write' system call = 4
    mov ebx, 1           ; file descriptor 1 = STDOUT
    mov ecx, hello       ; string to write
    mov edx, hello.len   ; length of string to write
    int 80h              ; call the kernel (syscall) using 0x80 interrupt

    mov eax, 1           ; 'exit' system call
    mov ebx, 0           ; exit with error code 0
    int 80h              ; call the kernel (syscall) using 0x80 interrupt
