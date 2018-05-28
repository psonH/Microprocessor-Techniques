mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh, "Enter the number:$"
msg2 db 0Ah,0Dh, "The sum of numbers:$"
arr1 db 05,?,05 dup('$')
part1 db 00h
part2 db 00h
sum db 00h
.code
mov ax,@data
mov ds,ax

mov cl,04h
lea si,arr1
l1:mess msg1
mov ah,01h
int 21h
mov bl,al
cmp bl,3Ah
jc d3
sub bl,07h
d3:and bl,0Fh
mov [si],bl
inc si
dec cl
jnz l1

mess msg2
mov cl,04h
lea si,arr1
l2:add dx,[si]
inc si
dec cl
jnz l2


mov part1,dh
mov bh,part1
call disp
mov part2,dl
mov bh,part2
call disp

disp proc near
mov sum,bh
mov bh,sum
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d1
add bh,07h
d1:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,sum
and bh,0Fh
cmp bh,0Ah
jc d2
add bh,07h
d2:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov ah,4ch
int 21h
end

