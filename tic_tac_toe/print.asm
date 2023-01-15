;--------------------;
; print
; By: Daniel and Peter
; 2023-01
;--------------------;

;--------------------;
; Explanation:
; The code below is a
;   function that
;   prints to console
;
; The buffer is taken
;   from stack, as is
;   the buffer size
;--------------------;


global print

print:
    push    ebp            
    mov     ebp, esp        

    mov     eax, 4                          ; specify stdout syscall
    mov     ebx, 1                          ; specify stdout file descriptor
    mov     ecx, [ebp+8]                    ; ebp+8 because that is where the buffer is on the stack
    mov     edx, [ebp+12]                   ; edp+8 as thats where the buffer size is on the stack
    int     0x80                            ; Calling kernel, 32 bit version of syscall

    mov     esp, ebp        
    pop     ebp             
    ret
     
