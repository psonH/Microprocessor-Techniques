.model small
.data
n1 db 0A7H
.code
mov ax,@data
mov ds,ax
mov al,n1
mov bl,03H
add al,bl
mov ah,4ch
int 21h
end

