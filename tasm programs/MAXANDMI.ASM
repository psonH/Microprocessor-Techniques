mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the number:$"
msg2 db 0Ah,0Dh,"The maximum number:$"
msg3 db 0Ah,0Dh,"The minimum number:$"
arr1 db 05h,?,05h dup('$')
lrg db 00h
sml db 00h
num db 00h
.code
mov ax,@data
mov ds,ax

lea si,arr1
mov cl,05h
l1:mess msg1
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
mov [si],bh
inc si
dec cl
jnz l1

mov bh,00h
mov cl,05h
lea si,arr1
l2:mov ah,[si]
cmp ah,bh
jl nxt1
mov bh,ah
nxt1:
inc si
dec cl
jnz l2

mov lrg,bh

mov bh,lrg
mov cl,05h
lea si,arr1
l3:mov ah,[si]
cmp ah,bh
jg nxt2
mov bh,ah
nxt2:
inc si
dec cl
jnz l3

mov sml,bh

mess msg2
mov bh,lrg
call disp

mess msg3
mov bh,sml
call disp

mov ah,4ch
int 21h

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
