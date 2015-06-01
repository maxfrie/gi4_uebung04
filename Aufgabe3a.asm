SECTION .data
	a DD 0
	b DD 7

SECTION .text
	GLOBAL main

main:
	MOV eax, dword [a] ; alten Wert von a in eax retten, da Post-Increment
	INC dword [a]
	CMP eax, 0
	JE l1 	; wenn a == 0

	MOV dword [b], 0	; Wenn nicht
	JMP l2

l1:
	MOV dword [b], 1

l2:
	MOV ebx, 0
	MOV eax, 1
	INT 0x80
