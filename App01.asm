;suma de numeros
; Lopez Casta?eda Jesus Saul 
 
            .model small
            .stack
            .data
            ;mensajes a mostrar
titulo      db "Suma De Dos Numeros de 1-9 $"
mensaje1    db 10, 13, "Ingresa Numero 1: $" 
mensaje2    db 10, 13, "Ingresa Numero 2: $"
Respuesta   db 10, 13, "El resultado de la suma es: $"
            ;variables para almacenar los numeros
n1        db 0
n2        db 0
resultado   db 0
            .code
suma        proc
            .startup
            mov ax, seg @data
            mov ds, ax
            
            ;mostrar titulo
            mov ah, 09h
            lea dx, titulo
            int 21h
            
            ;mostrar el mensaje1
            mov ah, 09h
            lea dx, mensaje1
            int 21h
            
            ;leer el primer numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov n1, al
            
            ;mostrar el mensaje2
            mov ah, 09h
            lea dx, mensaje2
            int 21h
            
            ;leer el segundo numero
            mov ah, 01h
            int 21h
            sub al, 30h
            mov n2, al
            ;OPERACIOn
            mov al, n1
            add al, n2;con add se suma el valor de n2 a al 
            mov resultado, al ;se mueve el valor de al a resultado
            
            ;se imprime el mensaje De respuesa
            mov ah, 09h
            lea dx, Respuesta
            int 21h
            
            ; imprime el primer digito de la suma
            mov al, resultado
            AAM
            mov bx, ax
            mov ah, 02h
            mov dl, bh
            add dl, 30h
            int 21h
            
            ;Imprime el segundo digito
            mov ah, 02h
            mov dl, bl
            add dl, 30h
            int 21h
            
            .exit
suma        endp
            end