mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the numbers:$"
msg2 db 0Ah,0Dh,"Number of positive numbers:$"
msg3 db 0Ah,0Dh,"Number of negative numbers:$"
arr1 db 06h,?,06h dup('$')
count1 db 00h
count2 db 00h
num db 00h
.code
mov ax,@data
mov ds,ax

lea si,arr1
mov cl,06h
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
cmp al,3Ah
jc d2
sub al,07h
d2:and al,0Fh
add bl,al
mov [si],bl
inc si
dec cl
jnz l1

mov cl,06h
lea si,arr1
l2:mov bl,[si]
rol bl,01h
jc negnum
add count1,01h
negnum:
inc si
dec cl
jnz l2

mov bh,count1
mov bl,06h
sub bl,bh
mov count2,bl

mess msg2
call disp
mess msg3
mov bh,count2
call disp

mov ah,4ch
int 21h

disp proc near
mov num,bh
mov bh,num
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d3
add bh,07h
d3:add bh,30h
mov dl,30h
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
