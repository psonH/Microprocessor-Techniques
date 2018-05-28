.model small
.data
n1 db 00h
msg db 0Ah,0Dh,"The result is:$"
.code
mov ax,@data
mov ds,ax
mov al,12h
mov bl,05h
mul bl
lea dx,msg
mov ah,09h
int 21h
mov n1,al
mov bh,n1
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d1
add bh,07h
d1:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,n1
and bh,0Fh
cmp bh,0Ah
jc d2
add bh,07h
d2:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov ah,4ch
int 21h
end

