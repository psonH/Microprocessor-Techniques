mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.model small
.data
msg1 db 0Ah,0Dh,"The program has run."
.code

mov ax,@data
mov ds,ax

mess msg1

mov ah,4ch
int 21h
end
