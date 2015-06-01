SECTION .data
	i DD 10
	ergebnis DD 1

SECTION .text
	GLOBAL main

main:
	DEC dword [i]
	JE exit

	MOV eax, dword [ergebnis]
	IMUL eax, dword [i]
	MOV dword [ergebnis], eax
	JMP main

exit:
	MOV ebx, 0
	MOV eax, 1
	INT 0x80
