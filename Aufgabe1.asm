SECTION .data
	n DD 5
	ergebnis DD 0

SECTION .text
	global main
	
main:
	mov eax, 1
	mov ecx, dword [n]
	
	cmp ecx, 0 	;prüfen n auf 0, da sonst endlosschleife
	je exit

l1:
	mul ecx
	loop l1

exit:
	mov dword [ergebnis], eax

	mov ebx, 0
	mov eax, 1
	int 0x80


