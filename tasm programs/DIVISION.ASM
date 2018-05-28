.model small
.data
n1 db 16h
n2 db 02h
.code
mov ax,@data
mov ds,ax

mov ax,16h
mov bh,02h
div bh

mov ah,4ch
int 21h
end
