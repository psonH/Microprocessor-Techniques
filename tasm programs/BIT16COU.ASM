mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the number:$"
msg2 db 0Ah,0Dh,"The number of 0's in the number are:$"
part1 db 00h
part2 db 00h
num db 00h
.code
mov ax,@data
mov ds,ax

mess msg1
call accept
mov part1,bh
call accept
mov part2,bh

mov bh,part1
mov bl,part2

mov cl,10h
mov al,00h
l1:rcl bx,01h
jc nxt
add al,01h
nxt:
dec cl
jnz l1

mov num,al
mess msg2
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
mov bh,num
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
