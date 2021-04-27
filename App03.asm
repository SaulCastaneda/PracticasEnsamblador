; Division De Dos Numeros
;Lopez Casta?eda Jesus Saul
              .model small
              .stack
              .data
              ;Mensaje A Mostrar
              Titulo    db 10,13, "DIVISIon de dos Numeros de 1-9 $"
   mensaje1  db 10,13, "Ingresa Numero 1: $"
   mensaje2  db 10,13, "Ingresa Numero 2: $"
   Respuesta db 10,13, "El Resultado de la Division  es $"
   ;Variables para almacenar datos
   n1        db 0
   n2        db 0
   Resultado db 0 
               .code
   Division       proc
                .startup
                 mov ax, seg @data
                 mov ds, ax
            
                ; Mostrar Titutlo
                 mov ah, 09h
                 lea dx, Titulo
                 int 21h
                 ; Muestra Mensaje 1
                 mov ah, 09h
                 lea dx,mensaje1
                 int 21h
                 ;Leer el primer numero
                 mov ah,01h
                 int 21h 
                 sub al,30h
                 mov n1,al
                 ;Muestra mensaje 2
                 mov ah,09h
                 lea dx ,mensaje2
                 int 21h
                 ;LEER El Segundo Numero
                 
                  mov ah,01h
                 int 21h 
                 sub al,30h
                 mov n2,al
                 
                 ; OPERaCION
                  xor ax, ax
                  mov bl,n1
                  mov al,n2
                 div bl
                 mov Resultado ,al
                 ; IMPRIMIR LA RESPUESTA
                 mov ah,09h
                 lea dx,Respuesta
                 int 21h
                 ; IMPRIMIR Primer Digito de la resta
                    mov al, Resultado
                    AAM
                    mov bx, ax
                    mov ah, 02h
                    mov dl, bh
                    add dl, 30h
                    int 21h
                    ; IMPRIME Segundo Digito de la resta
                    mov ah, 02h
                    mov dl, bl
                    add dl, 30h
                    int 21h                      
                    .exit
Division   endp
            end