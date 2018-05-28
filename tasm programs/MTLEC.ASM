.model small
.data
arr1 db 05,?,05 dup('$')
.code
mov ax,@data
mov ds,ax
mov cl,04h
lea si,arr1
l1:mov ah,01h
int 21h
mov [si],al
inc si
dec cl
jnz l1

mov cl,04h
lea si,arr1
l2:mov dl,[si]
mov ah,02h
int 21h
inc si
dec cl
jnz l2
mov ah,4ch
int 21h
end

