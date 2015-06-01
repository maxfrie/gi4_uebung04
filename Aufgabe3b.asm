SECTION .data
	a RESD 10 ; int a[10]

SECTION .text
	GLOBAL main

main:
	MOV ecx, 0
	MOV ebx, a	; in ebx Adresse von a
l1:
	CMP ecx, 10
	JGE l2	; Abbruch bei i >= 10

	MOV dword [ebx+ecx*4], ecx
	INC ecx
	JMP l1 

l2:
	MOV ebx, 0
	MOV eax, 1
	INT 0x80
