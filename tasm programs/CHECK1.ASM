.model small
.data
n1 dw 0FFh
n2 dw 0FFh
.code
mov ax,@data
mov ds,ax
mov bx,n1
mov cx,n2
add bx,cx
mov ah,4ch
int 21h
end
