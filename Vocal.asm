STACK SEGMENT STACK
   DB 64 DUP(?)
STACK ENDS
;-----------------------------------------------------
DATA SEGMENT
enter db 13,10,'$'
cadena db '                       $'
txt1 db 'No se encontro ninguna vocal$'
letraA db 10,13,'La primera vocal fue:',10,13,'*******',10,13,'*     *',10,13,'*     *',10,13,'*******',10,13,'*     *',10,13,'*     *',10,13,'*     *',10,13,'$'
letraE db 10,13,'La primera vocal fue:',10,13,'*******',10,13,'*      ',10,13,'*      ',10,13,'*******',10,13,'*      ',10,13,'*      ',10,13,'*******',10,13,'$'
letraI db 10,13,'La primera vocal fue:',10,13,'*******',10,13,'   *   ',10,13,'   *   ',10,13,'   *   ',10,13,'   *   ',10,13,'   *   ',10,13,'*******',10,13,'$'
LetraO db 10,13,'La primera vocal fue:',10,13,'*******',10,13,'*     *',10,13,'*     *',10,13,'*     *',10,13,'*     *',10,13,'*     *',10,13,'*******',10,13,'$'
LetraU db 10,13,'La primera vocal fue:',10,13,'*     *',10,13,'*     *',10,13,'*     *',10,13,'*     *',10,13,'*     *',10,13,'*     *',10,13,'*******',10,13,'$'
DATA ENDS
;-----------------------------------------------------
CODE SEGMENT
Assume DS:DATA, CS:CODE, SS:STACK
BEGIN:mov ax,data
       mov ds,ax
	 ;-----------------------------------
       mov ah,00h  ;modo 80x25 a color
       mov al,03h
       int 10h
	;------ MODO DE PANTALLA-------------
	
       mov cx,23   ; el contador vale 23
       mov si,0  ;puntero de pila en 0   

leer: 
       mov ah,07h ; esperar recibir un caracter y lo coloca en al
       int 21h 	   
	  
	   mov dl,al  ; se mueve a dl porque el 02 exhibe el caracter en dl
       mov ah,02h
       int 21h
	   

       mov cadena[si],al
       inc si

	   cmp AL,enter
	   je Declarar
	   
       loop leer ; decrementa el contador     hasta que el contador sea 0 se detiene	   
	;--------------va a llenar el "arreglo"--------------------------------------	
Declarar:	
	   mov cx,23
	   mov si,0
Validar:cmp cadena[si], 97   ;-------la a -----------;
        JE MOSTRARa
	    cmp cadena[si], 65  ;-------la A -----------;
        JE MOSTRARa
        cmp cadena[si],101 ;-----------e-------------
		JE MOSTRARe
		cmp cadena[si],69    ; la E
		JE MOSTRARe
		cmp cadena [si],105;-------i----
		JE MOSTRARi
		cmp cadena [si], 73 ; LA I
		JE MOSTRARi
		cmp cadena[si],111;-----o-------
		JE MOSTRARo
		cmp cadena [si], 79 ; la O
		JE MOSTRARo
		cmp cadena[si],117;-----u-------
		JE MOSTRARu
		cmp cadena [si],85 ; la u
		JE MOSTRARu	   
		inc si
		loop validar
	 ;--------Validar Vocales-----------------------------------
	 lea dx,txt1
	 mov ah, 09h        
	 int 21h
	 

FIN: MOV AX,4C00H
     INT 21H
     RET	 
;------------MIS ETIQUETAS--------------------------------	 

MOSTRARa:
	   ;creamos cuadro
        mov cx, 0200h ;coordenadas de la esquina superior izquierda (renglon,columna) (0,0)
        mov dx, 0814h ;coordenadas de la esquina superior derecha (renglon,columna) (9,37)
        xor al, al;AL es el numero de lineas
        mov bh, 04h ;atributo a utilizar para las lineas: (FONDO,LETRAS)
        mov ah, 6 ;Cambio a la pagina anterior activa
        int 10h  
		mov ah,09h
		mov dx,offset letraA
		int 21h		 
     JMP FIN
MOSTRARe:;creamos cuadro
        mov cx, 0200h ;coordenadas de la esquina superior izquierda (renglon,columna) (0,0)
        mov dx, 0814h ;coordenadas de la esquina superior derecha (renglon,columna) (9,37)
        xor al, al;AL es el numero de lineas
        mov bh, 04h ;atributo a utilizar para las lineas: (FONDO,LETRAS)
        mov ah, 6 ;Cambio a la pagina anterior activa
        int 10h 

		mov ah,09h
		mov dx,offset letraE
		int 21h		 
     JMP FIN
MOSTRARi:
        mov cx, 0200h ;coordenadas de la esquina superior izquierda (renglon,columna) (0,0)
        mov dx, 0814h ;coordenadas de la esquina superior derecha (renglon,columna) (9,37)
        xor al, al;AL es el numero de lineas
        mov bh, 04h ;atributo a utilizar para las lineas: (FONDO,LETRAS)
        mov ah, 6 ;Cambio a la pagina anterior activa
        int 10h  

		mov ah,09h
		mov dx,offset letraI
		int 21h		 
     JMP FIN
MOSTRARo:
        mov cx, 0200h ;coordenadas de la esquina superior izquierda (renglon,columna) (0,0)
        mov dx, 0814h ;coordenadas de la esquina superior derecha (renglon,columna) (9,37)
        xor al, al;AL es el numero de lineas
        mov bh, 04h ;atributo a utilizar para las lineas: (FONDO,LETRAS)
        mov ah, 6 ;Cambio a la pagina anterior activa
        int 10h  
		
		mov ah,09h
		mov dx,offset letraO
		int 21h		 
     JMP FIN
MOSTRARu:
        mov cx, 0200h ;coordenadas de la esquina superior izquierda (renglon,columna) (0,0)
        mov dx, 0814h ;coordenadas de la esquina superior derecha (renglon,columna) (9,37)
        xor al, al;AL es el numero de lineas
        mov bh, 04h ;atributo a utilizar para las lineas: (FONDO,LETRAS)
        mov ah, 6 ;Cambio a la pagina anterior activa
        int 10h  
		mov ah,09h
		mov dx,offset letraU
		int 21h		 
     JMP FIN
CODE ENDS
     END BEGIN