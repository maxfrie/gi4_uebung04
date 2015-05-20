SECTION .data
	n DD 100
	ergebnis DQ 0
	z1h DD 0
	z1l DD 0
	z2h DD 0
	z2l DD 0

SECTION .text
	global main

main:
	push ebp
	mov ebp, esp

	; Stack vorinitialisieren mit High und Low Variablen
	push 0 ; Zahl 1 Low
	push 1 ; Zahl 2 Low
	push 0 ; Zahl 1 High
	push 0 ; Zahl 2 High
	
	mov ecx, dword [n] ; Schleifen-Counter setzen

schleife:
	pop dword [z2h]
	pop dword [z1h]
	pop dword [z2l]
	pop dword [z1l]

	mov ebx, dword [z2l]
	mov eax, dword [z1l]
	add eax, ebx
	push ebx
	push eax
	mov ebx, dword[z2h]
	mov eax, dword[z1h]
	adc eax, ebx
	push ebx
	push eax
	loop schleife

speichern:
	pop dword [z2h]
        pop dword [z1h]
        pop dword [z2l]
        pop dword [z1l]

	mov edx, dword [z2h]
	mov eax, dword [z2l]
	
	mov dword [ergebnis], eax
	mov dword [ergebnis+1], edx

exit:
	mov esp, ebp
	pop ebp

	mov ebx, 0
	mov eax, 1
	int 0x80
