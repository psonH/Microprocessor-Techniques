mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter a number:$"
msg2 db 0Ah,0Dh,"The number is PRIME.$"
msg3 db 0Ah,0Dh,"The number is COMPOSITE.$"
num db 00h
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

cmp bh,02h
jl lab1

cmp bh,02h
je lab2

cmp bh,03h
je lab2

mov cl,02h
mov ah,00h
mov al,num
div cl

mov cl,al

l1:mov ah,00h
mov al,num
div cl
cmp ah,01h
je lab2
dec cl
jnz l1

lab1:mess msg3
jmp exit

lab2:mess msg2
exit:mov ah,4ch
int 21h
end
