section .data
        hello db 'Welcome to my ASCII outputer factorial of 5', 0xa
        helloLen equ $ - hello

section .bss
        num resb 3
	
section .text
        global _start

_start:
        mov eax, 4
        mov ebx, 1
        mov ecx, hello
        mov edx, helloLen
        int 80h

        mov eax, 5
        call factorial
	mov [num], eax
        mov eax, 4
        mov ebx, 1
	lea ecx, num
        mov edx, 3
        int 80h

        xor ebx, ebx
        mov eax, 1
        int 80h

factorial:
        cmp eax, 1
        jle .end
        push eax
        dec eax
        call factorial
        pop ebx
        mul ebx
.end:
        ret

