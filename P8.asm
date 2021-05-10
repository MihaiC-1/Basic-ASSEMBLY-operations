;Tema p8: z=(a+b+c+1)^3/(a-b*c+d)

ASSUME cs:code_, ds:data_
data_ SEGMENT
	a dw 5
	b dw 1
	c dw 3
	d dw 7
	rez dw ?
	rez_rest dw ?
data_ ENDS

code_ SEGMENT
start:
	mov ax, data_
	mov ds, ax
	
	mov ax, b
	mul c         ; ax = b * c
	
	mov bx, a
	sub bx, ax    ; bx = a - b*c
	add bx, d     ; bx = (a - b*c + d)
	
	mov ax, a     ; ax = a
	add ax, b     ; ax = a + b
	add ax, c     ; ax = a + b + c
	add ax, 1     ; ax = (a + b + c + 1)	
	mov cx, ax    ; cx = (a + b + c + 1)
	mul cx        ; ax = (a + b + c + 1)^2
	mul cx        ; ax = (a + b + c + 1)^3
	cwd
	div bx        ; ax = (a + b + c + 1)^3/(a - b * c + d), iar in dx este restul
	
	mov rez, ax
	mov rez_rest, dx
	
	mov ax, 4100h
	int 21h
code_ ENDS
END start
	