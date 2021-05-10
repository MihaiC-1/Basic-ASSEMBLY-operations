; Tema P15 : z=((a+b*c-d)/f+h)/g = (a + b*c - d + f*h)/(f*g)

ASSUME cs:code_, ds:data_

data_ SEGMENT
	a dw 5
	b db 2
	c db 3
	d dw 4
	f dw 1
	h dw 2
	g db 2
	rez dw ?
	rez_rest dw ?
data_ ENDS

code_ SEGMENT
start:
	mov ax, data_
	mov ds, ax
	
	mov ah, 0
	mov al, b
	mul c      ; ax = b*c
	add ax, a  ; ax = b*c + a
	sub ax, d  ; ax = (b*c + a -d)
	
	mov bx, ax    ; bx = (b*c + a -d)
	mov ax, f     ; ax = f
	mul h         ; ax = f*h
	add ax, bx    ; ax = (a + b*c - d + f*h)
	
	mov cx, ax    ; cx = (a + b*c - d + f*h)
	mov ax, f     ; ax = f
	mul g         ; ax = f*g
	
	mov bx, ax    ; bx = f*g
	mov ax, cx    ; ax = (a + b*c - d + f*h)
	cwd
	div bx        ; ax = (a + b*c - d + f*h)/(f*g), iar in dx este restul impartirii
	
	mov rez, ax
	mov rez_rest, dx
	
	mov ax, 4100h
	int 21h
code_ ENDS
END start