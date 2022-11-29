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
