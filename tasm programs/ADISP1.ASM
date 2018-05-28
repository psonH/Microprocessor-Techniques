.model small
.data
n1 db 00h
.code
mov ax,@data
mov ds,ax

call accept
mov n1,bl

call accept
add bl,n1


call disp
mov ah,4ch
int 21h

accept proc near
mov ah,01h
int 21h
mov bl,al
cmp bl,3Ah
jc d1
sub bl,07h
d1:and bl,0Fh
rol bl,04h
mov ah,01h
int 21h
cmp al,3Ah
jc d2
sub al,07h
d2:and al,0Fh
add bl,al
ret
endp

disp proc near
mov cl,bl
and cl,0F0h
rol cl,04h
cmp cl,0Ah
jc d3
add cl,07h
d3:add cl,30h
mov dl,cl
mov ah,02h
int 21h
mov cl,bl
and cl,0Fh
cmp cl,0Ah
jc d4
add cl,07h
d4:add cl,30h
mov dl,cl
mov ah,02h
int 21h
ret
endp
end
