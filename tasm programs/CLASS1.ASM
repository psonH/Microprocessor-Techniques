.model small
.data
n1 db 03h
.code
mov ax,@data
mov ds,ax
call addn
mov ah,4ch
int 21h
addn proc near
mov al,05h
mov bl,n1
add al,bl
ret
endp
end
