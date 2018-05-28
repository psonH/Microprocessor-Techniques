mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
arr1 db 01h,02h,03h,04h,05h,06h,07h,08h
arr2 db 08h,07h,06h,05h,04h,03h,02h,01h
sum db 08h,?,08h dup('$')
msg1 db 0Ah,0Dh,"The sum of arrays:$"
msg2 db ",$"
num db 00h
.code
mov ax,@data
mov ds,ax

mov cl,08h
lea si,arr1
lea di,arr2
lea bx,sum
l1:mov al,[si]
add al,[di]
mov [bx],al
inc si
inc di
inc bx
dec cl
jnz l1

mess msg1
mov cl,08h
lea si,sum
l2:mov bh,[si]
mov num,bh
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d1
add bh,07h
d1:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,num
and bh,0Fh
cmp bh,0Ah
jc d2
add bh,07h
d2:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mess msg2
inc si
dec cl
jnz l2

mov ah,4ch
int 21h
end
