;-------------------;
; Hello World
; By: Daniel
; 2022-11-29
;-------------------;

;-------------------; SYSTEM CALLS
SYS_WRITE   equ 1   ; write to _
SYS_EXIT    equ 60  ; end program
;-------------------;

;-------------------;
STDIN       equ 0   ; standard input
STDOUT      equ 1   ; standard output
;-------------------;

; Block Starting Symbol, statically allocated variables(not necessarly assigned)
section .bss

; Defining variables that do not change at runtime(constants)
section .data
  message: db "Hello, world!", 0xA  ; 0xA -> \n
  messageLen: equ $-message         ; messageLen is equal to total charachters in message
  board: .space 9                   ; reserves 9 bytes (1 byte per element)
    
    


global _start

section .text

; Entry point for linker
_start:
  mov rax, SYS_WRITE    ; Setting system call to 1(sys_write)
  mov rdi, STDOUT       ; Setting rdi to 1(stdout)
  mov rsi, message      ; rsi for sys_write is const char *buf or
                        ;   in english, the message
  mov rdx, messageLen   ; rdx for sys_write is size_t count or in
                        ;   in engligh, the message size
  syscall               ; system call

  mov rax, SYS_EXIT     ; Setting system call to 60(sys_exit)
  mov rbx, 0            ; Setting rdi to 0(program succesful)(return 0)
  syscall               ; system call

printSingleDigitInt:
    ; takes in a single digit int and prints the assci equivalent
    ; when a function is called, the return value is placed on the stack

    ; we need to keep this, so that we can return to the corret place in our program!
    pop r14                     ; pop the return address to r9
    pop r15                     ; pop the "parameter" we placed on the stack
    add r15, 48                 ; add the ascii offset
    push r15                    ; place it back onto the stack

    ; write value on the stack to STDOUT
    mov rax, 1                  ; system call for write
    mov rdi, 1                  ; file handle 1 is stdout
    mov rsi, rsp                ; the string to write popped from the top of the stack
    mov rdx, 1                  ; number of bytes
    syscall                     ; invoke operating system to do the write

    ;add     $8, %rsp    # restore sp -> not sure this is neede!

    ; https://stackoverflow.com/questions/8201613/printing-a-character-to-standard-output-in-assembly-x86
    ; print a new line
    mov rax, 1                  ; system call for write
    mov rdi, 1                  ; file handle 1 is stdout
    mov rsi, db 10              ; address of string to output
    mov rdx, 1                  ; number of bytes
    syscall                     ; invoke operating system to do the write

    push r14                    ; put the return address back on the stack to get back
    ret                         ; return
