.model small
.data
n1 db 00h
.code
mov ax,@data
mov ds,ax
mov ah,01h
int 21h
mov bl,al
sub bl,30h
mov ah,01h
int 21h
sub al,30h
add al,bl
end

