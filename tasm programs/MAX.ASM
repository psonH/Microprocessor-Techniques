mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the number:$"
msg2 db 0Ah,0Dh,"The maximum number is:$"
arr1 db 0Ah,?,0Ah dup(00h)
lrg db 00h
.code
mov ax,@data
mov ds,ax

mov cl,05h
lea si,arr1
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

mess msg2
mov cl,05h
mov bh,00h
lea si,arr1
l2:mov bl,[si]
cmp bl,bh
jl d3
mov bh,bl
d3:
inc si
dec cl
jnz l2

mov lrg,bh
mov bh,lrg
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d4
add bh,07h
d4:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,lrg
and bh,0Fh
cmp bh,0Ah
jc d5
add bh,07h
d5:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov ah,4ch
int 21h
end
