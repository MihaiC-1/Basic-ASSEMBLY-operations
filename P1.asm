;Tema P1 : z = 1/(a*a+b*b-5)+2/(a*a-b*b+4) = (3*a*a+b*b-6)/(a*a+b*b-5)(a*a-b*b+4)

ASSUME cs:code_, ds:data_
data_ SEGMENT
	a dw 3
	b dw 2
	prod_a dw ?
	prod_b dw ?
	rez dw ?
	rez_rest dw ?
data_ ENDS

code_ SEGMENT
start:
	mov ax, data_
	mov ds, ax
	
	mov ax, a             ; ax = a
	mul a                 ; ax = a*a
	mov prod_a, ax        ; prod_a = a*a
	
	mov ax, b             ; ax = b
	mul b                 ; ax = b*b
	mov prod_b, ax        ; prod_b = b*b
	
	mov bx, prod_a        ; bx = a*a
	add bx, prod_b        ; bx = a*a + b*b
	sub bx, 5             ; bx = (a*a + b*b - 5)
	
	mov ax, prod_a        ; ax = a*a
	sub ax, prod_b        ; ax = a*a - b*b
	add ax, 4             ; ax = (a*a-b*b+4)
	mul bx                ; ax = (a*a+b*b-5)(a*a-b*b+4)
	mov bx, ax            ; bx = (a*a+b*b-5)(a*a-b*b+4)
	
	mov ax, prod_a        ; ax = a*a
	add ax, prod_a        ; ax = a*a + a*a = 2*a*a
	add ax, prod_a        ; ax = 3*a*a          
	add ax, prod_b        ; ax = 3*a*a + b*b
	sub ax, 6             ; ax = 3*a*a + b*b - 6
	cwd                   ; converteste valoarea din ax din word in double word pentru a salva restul in dx
	div bx                ; ax = (3*a*a + b*b - 6)/(a*a+b*b-5)(a*a-b*b+4), iar in dx restul inpartirii
	
	mov rez, ax
	mov rez_rest, dx
	
	mov ax, 4100h
	int 21h
code_ ENDS
END start