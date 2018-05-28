mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the string:$"
msg2 db 0Ah,0Dh,"The length:$"
arr1 db 0Ah,?,0Ah dup('$')
siz db 00h
.code
mov ax,@data
mov ds,ax

lea si,arr1
mess msg1
mov dx,si
mov ah,0Ah
int 21h

lea si,arr1
mov bh,[si+01h]
mov siz,bh

mess msg2
mov siz,bh
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d1
add bh,07h
d1:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,siz
and bh,0Fh
cmp bh,0Ah
jc d2
add bh,07h
d2:add bh,30h
mov dl,bh
mov ah,02h
int 21h

mov ah,4Ch
int 21h
end

