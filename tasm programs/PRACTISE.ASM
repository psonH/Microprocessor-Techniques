mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter a number:$"
msg2 db 0Ah,0Dh,"Sum of numbers upto 'n':$"
num db 00h
sum db 00h
.code
mov ax,@data
mov ds,ax

mess msg1
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
mov num,bh

mov cl,num
mov bh,00h
l1:adc bh,cl
dec cl
jnz l1

mess msg2
mov sum,bh
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d3
add bh,07h
d3:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,sum
and bh,0Fh
cmp bh,0Ah
jc d4
add bh,07h
d4:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov ah,4ch
int 21h
end

