section	.rodata		
	format_string: db "%d", 10, 0	

section .text                   
        global assFunc
        extern c_checkValidity   
        extern printf

assFunc:
        ; pushad
        ; pushfd                        		
        push ebp              		
        mov ebp, esp     		                 	
        mov ebx, dword [ebp + 8]
        mov ecx, ebx 
        push dword ebx
        call c_checkValidity
        ; pop ecx
        shl ecx, 2           
        cmp dword eax, 0        
        jnz end                  
        shl ecx, 1 
                                
        end:
        push dword ecx
        push format_string
        call printf         	
        
        ; popfd
        ; popad                    	      		
        mov esp, ebp			
        pop ebp				      
        ret	    