; --------------------------------------------------------------
; Writes "Hello, World!" to the console using only system calls.
; Runs on 64-bit x86 Linux only.
; --------------------------------------------------------------

section .bss
     ; variables here

section .data

    ;  constants here
     hello: db "Hello, World!", 10  ; string to print
     helloLen: equ $-hello          ;  length of string

section .text
    global _start                  ; entry point for linker

    _start:                        ; start here
        mov rax, 1                 ; system call for write
        mov rdi, 1                 ; file handle 1 is stdout
        mov rsi, hello             ; address of string to output
        mov rdx, helloLen          ; number of bytes
        syscall                    ; invoke operating system to do the write 

        mov rax, 60                ; system call for exit 
        mov rdi, 0                 ; exit code 0 
        syscall                    ; invoke operating system to exit 
