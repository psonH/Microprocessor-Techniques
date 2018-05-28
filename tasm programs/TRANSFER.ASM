mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the number:$"
msg2 db 0Ah,0Dh,"The array is as follows:$"
msg3 db ",$"
num db 00h
.code
mov ax,@data
mov ds,ax
mov es,ax

mov si,0048h
mov di,0050h

mov cl,08h
l1:mess msg1
mov ah,01h
int 21h
mov bh,al
cmp bh,3Ah
jc d1
sub bh,07h
d1:and bh,0Fh
rol bh,04h
mov ah,01h
int 21h
cmp al,3Ah
jc d2
sub al,07h
d2:and al,0Fh
add bh,al
mov [si],bh
inc si
dec cl
jnz l1

mov cl,08h
mov si,0048h
l2:mov bh,[si]
mov [di],bh
inc si
inc di
dec cl
jnz l2

mess msg2
mov di,0050h
mov cl,08h
l3:mov bh,[di]
mov num,bh
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d3
add bh,07h
d3:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,num
and bh,0Fh
cmp bh,0Ah
jc d4
add bh,07h
d4:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mess msg3
inc di
dec cl
jnz l3

mov ah,4ch
int 21h
end



