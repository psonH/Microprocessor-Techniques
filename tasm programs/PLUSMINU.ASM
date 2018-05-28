mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the number:$"
msg2 db 0Ah,0Dh,"Number of positive numbers:$"
msg3 db 0Ah,0Dh,"Number of negative numbers:$"
count1 db 00h
count2 db 00h
num db 00h
arr1 db 05h,?,05h dup('$')
.code
mov ax,@data
mov ds,ax

mov cl,05h
lea si,arr1
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

lea si,arr1
mov cl,05h
l2:mov bh,[si]
and bh,80h
jz nxt
add count1,01h
nxt:
inc si
dec cl
jnz l2

mov bl,05h
mov bh,count1
sub bl,bh
mov count2,bl

mess msg2
mov bh,count2
call disp

mess msg3
mov bh,count1
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




