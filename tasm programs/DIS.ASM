.model small
.data
ans db 1Ah
.code
mov ax,@data
mov ds,ax
mov bh,ans
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d1
add bh,07h
d1:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bl,ans
and bl,0Fh
cmp bl,0Ah
jc d2
add bl,07h
d2:add bl,30h
mov dl,bl
mov ah,02h
int 21h
mov ah,4ch
int 21h
end

