.model small
.data
n1 db 12h
n2 db 15h
.code
mov ax,@data
mov ds,ax
mov bh,n1
mov bl,n2
sub bh,bl
mov ah,4ch
int 12h
end
