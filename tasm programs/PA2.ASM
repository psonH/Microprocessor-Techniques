mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
arr1 db 0Ah,?,0Ah dup('$')
msg1 db 0Ah,0Dh,"Enter the number in to array:$"
msg2 db 0Ah,0Dh,"Sum of the numbers is:$"
ans db 00h
.code
mov ax,@data
mov ds,ax
mess msg1
mov cl,0Ah
lea si,arr1
l1:mov ah,01h
int 21h
mov [si],al
inc si
dec cl
jnz l1

mov cl,0Ah
lea si,arr1
l2:add bl,[si]
inc si
dec cl
jnz l2

mess msg2
mov ans,bl
and bl,0F0h
rol bl,04h
cmp bl,0Ah
jc d1
add bl,07h
d1:add bl,30h
mov dl,bl
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

