SECTION .data
	n DD 5
	ergebnis DD 0

SECTION .text
	global main
	
main:
	mov eax, 1
	mov ecx, dword [n]
	
	cmp ecx, 0 	;prüfen n auf 0, da sonst endlosschleife
	jz exit

schleife:
	mul ecx
	mov dword [ergebnis], eax
	loop schleife

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80


