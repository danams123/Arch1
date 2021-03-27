section	.rodata			; we define (global) read-only variables in .rodata section
	format_string: db "%d", 10, 0	; format string

section .text                    	; we write code in .text section
        global assFunc
        extern c_checkValidity   
        extern printf

assFunc:
        pushad
        pushfd                        		
        push ebp              		
        mov ebp, esp         		
        pushad                   	
        mov ecx, dword [ebp + 4]
        push dword [ecx]
        call c_checkValidity
        shl ecx, 4             
        cmp byte [eax], 0        
        jnz end                  
        shl ecx, 2                          
        end:
        push dword [ecx]
        push format_string
        call printf         	

        popad                    	; restore all previously used registers       		
        mov esp, ebp			    ; free function activation frame
        pop ebp				        ; restore Base Pointer previous value (to returnt to the activation frame of main(...))
        ret	    