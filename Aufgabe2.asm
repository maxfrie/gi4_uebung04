SECTION .data
	n DD 50
	ergebnis DQ 0

SECTION .text
	global main

main:
	mov eax, 0 ; fib(0) LSB
	mov edx, 0 ; fib(0) MSB
	mov esi, 1 ; fib(1) LSB
	mov edi, 0 ; fib(1) MSB
	mov ecx, 0 ; Zähler initialisieren
			; sondern hochzählend mit Sprung

schleife:
	cmp ecx, dword [n] ; bis fib(n) berechnet?
	je fertig

	xchg eax, esi 	; tausche LSB fib(i+1) und fib(i)
	xchg edx, edi 	; tausche MSB fib(i+1) und fib(i)
	add eax, esi	; LSB fib(i+2) = fib(i) + fib(i+1)
	adc edx, edi	; MSB fib(i+2) = fib(i) + fib(i+1) + CF LSB
	jc fehler	; wenn Überlauf (CF), dann 64 Bit Überlauf

	inc ecx		; Zaehler i++
	jmp schleife

fehler:
	mov eax, 0 ; eax auf 0 setzen bei 64 Bit Überlauf
	mov edx, 0 ; edx auf 0

fertig:
	mov dword [ergebnis], eax	; Ergebnis sichern dabei
	mov dword [ergebnis+4], edx	; wegen Little Endian das MSB zuletzt

	mov ebx, 0	; Exit-Code auf 0 setzen
	mov eax, 1	; erfolgreich ausgeführt
	int 0x80	; und beendet
