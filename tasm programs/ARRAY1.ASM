mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the number:$"
msg2 db 0Ah,0Dh,"Sum of the numbers:$"
arr1 dw 0Ah,?,0Ah dup('$')
sum db 00h
part1 db 00h
part2 db 00h
.code
mov ax,@data
mov ds,ax

mov cl,0Ah
lea si,arr1
l1:mess msg1
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
mov bh,al
cmp bh,3Ah
jc d2
sub bh,07h
d2:and bh,0Fh
add bl,bh
mov [si],bl
inc si
dec cl
jnz l1

mov bx,0000h
mess msg2
mov cl,0Ah
lea si,arr1
l2:add bl,[si]
inc si
dec cl
jnz l2

mov part1,bh
mov part2,bl

mov bh,part1
call disp
mov bh,part2
call disp

mov ah,4ch
int 21h

disp proc near
mov sum,bh
mov bh,sum
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d3
add bh,07h
d3:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,sum
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
