.model small
.data
n1 db 00h
.code
mov ax,@data
mov ds,ax

mov di,0008h
mov si,0010h

mov cl,08h
l1:mov ch,[di]
mov [si],ch
inc di
inc si
dec cl
jnz l1

mov ah,4ch
int 21h
end
