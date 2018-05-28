mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.model small
.data
msg1 db 0Ah,0Dh,"Enter the first number:$"
msg2 db 0Ah,0Dh,"Enter the second number:$"
msg3 db 0Ah,0Dh,"The product is:$"
times db 00h
ans db 00h
.code
mov ax,@data
mov ds,ax

mess msg1
call accept
mov al,bl
mov times,al

mess msg2
call accept
mov al,times
mov ch,bl
mul ch
mess msg3
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
mov ans,al
mov bl,ans
and bl,0F0h
rol bl,04h
cmp bl,0Ah
jc d3
add bl,07h
d3:add bl,30h
mov dl,bl
mov ah,02h
int 21h
mov bl,ans
and bl,0Fh
cmp bl,0Ah
jc d4
add bl,07h
d4:add bl,30h
mov dl,bl
mov ah,02h
int 21h
ret
endp
end

