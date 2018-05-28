mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the 1st number:$"
msg2 db 0Ah,0Dh,"Enter the 2nd number:$"
msg3 db 0Ah,0Dh,"The sum of numbers is:$"
part1 db 00h
part2 db 00h
part3 db 00h
part4 db 00h
sum1 db 00h
sum2 db 00h
num db 00h
.code
mov ax,@data
mov ds,ax

mess msg1
call accept
mov part1,bh
call accept
mov part2,bh

mess msg2
call accept
mov part3,bh
call accept
mov part4,bh

mess msg3
mov ah,part1
mov al,part2
mov bh,part3
mov bl,part4
adc ax,bx
mov sum1,ah
mov sum2,al
jnc nxt
mov bh,00h
call disp
mov bh,01h
call disp
nxt:
mov bh,sum1
call disp
mov bh,sum2
call disp

mov ah,4ch
int 21h

accept proc near
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
ret
endp

disp proc near
mov num,bh
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d3
add bh,07h
d3:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,num
and bh,0Fh
cmp bh,0Ah
jc d4
add bh,07h
d4:add bh,30h
mov dl,bh
mov ah,02h
int 21h
ret
endp
end





