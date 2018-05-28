mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the string:$"
msg2 db 0Ah,0Dh,"The length of string:$"
arr1 db 0Ah,?,0Ah dup('$')
siz db 00h
.code
mov ax,@data
mov ds,ax

mess msg1
mov ch,00h
mov cl,0Ah
lea si,arr1
l1:mov ah,01h
int 21h
cmp al,24h
je l2
inc ch
inc si
dec cl
jnz l1

l2:
mess msg2
mov siz,ch
and ch,0F0h
rol ch,04h
cmp ch,0Ah
jc d1
add ch,07h
d1:add ch,30h
mov dl,ch
mov ah,02h
int 21h
mov ch,siz
and ch,0Fh
cmp ch,0Ah
jc d2
add ch,07h
d2:add ch,30h
mov dl,ch
mov ah,02h
int 21h

mov ah,4Ch
int 21h
end




