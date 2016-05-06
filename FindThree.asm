; Find Threes Assembly
; Chapter 8
;Gjvon Graves

include Irvine32.inc
     
.386
;.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

array DWORD 4, 5, 6, 3,3,3

.code
main proc
	
	push OFFSET array				
	call Threes					
	
main endp
	
Threes proc
	push ebp
	mov ebp, esp
	mov ebx, 0
	pushad
	mov esi, [ebp + 8]
	mov eax, [esi]
	cmp eax, 3
	je Found
	jne NotThree

		FindThree:
			add esi, type DWORD
			mov eax, [esi]
			cmp eax, 3
			je Found
			jne NotThree
			jmp FindThree
		Found:
			inc ebx
			cmp ebx, 3
			je FoundAllThree
			jmp FindThree
		FoundAllThree:
			mov eax, 1
			call WriteInt
			exit
		NotThree:
			mov ebx, 0
			cmp eax, 0
			je Done
			jmp FindThree
		Done:
			mov esp, ebp
			pop ebp
			exit
			
Threes endp

end main