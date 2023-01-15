;--------------------;
; input
; By: Daniel and Peter
; 2023-01
;--------------------;

;--------------------;
; Explanation:
; The code below is a
;   function that
;   recieves input
;   from the console
;   and puts it onto
;   the stack
;
; It does not push
;   to the stack
;   instead it uses
;   pointer to place
;   it in a specific
;   location
;--------------------;


global input

input:
    push    ebp            
    mov     ebp, esp        

    mov     eax, 3                          ; Syscall for read
    mov     ebx, 0                          ; File descriptor
    mov     ecx, [ebp+8]                    ; Destination
    mov     edx, [ebp+12]                   ; Size of destination
    int     0x80                            ; SYSCALL

    mov     esp, ebp        
    pop     ebp             
    ret 
    
