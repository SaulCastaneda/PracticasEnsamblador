;Par O Impar
;Jesus Saul Lopez Casta?eda
   .model small
   .stack
   .data
 Titulo db "PAR O IMPAR $"
 Mensaje db 10,13, "Ingresa un Numero: $"
 par  db 10,13 ,"NUMERO INGRESADO ES PAR :D $" 
 impar db 10,13,"NUMERO INGRESADO ES IMPAR :D $"
 ;metodo
 num db 0
 .code
 ParOImpar proc
 
           .startup
           mov ax,@data
           mov ds, ax
           
           mov ah ,00
           mov al,03h
           int 10h
           
           ;Mostrar el titulo
           mov ah,09h
           lea dx, Titulo
           int 21h
           mov ah, 09h
           lea dx,Mensaje
                 int 21h
           ;Scanner
            mov ah,01h
            int 21h
            sub al,30h
            mov num,al
            
            test num,1
            
            jp Par1
            jnp Impar1
            ; VALIDACIONES
            ;PAR
            Par1:
            mov ah,09h
            lea dx,par
            int 21h
            jmp fin
            ;IMPAR
            Impar1:
            mov ah,09h
            lea dx,impar
            int 21h
            jmp fin
            fin:
             mov ax, 4c00h
            int 21h
ParOImpar    endp
            end
                