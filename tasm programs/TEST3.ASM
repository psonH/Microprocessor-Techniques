.model small
.data
msg1 db "Enter the array$"
msg2 db "The max is$"
arr1 db 04h,?,04h dup ('$')
ans db 00h
.code
mov ax,@data
mov ds,ax

lea dx,msg1
mov ah,09h
int 21h

mov bl,04h
mov ch,00h
lea si,arr1
l1:call accept
inc si
dec bl
jnz l1

call findMax
mov ans,ch
mov bl,ans
call disp

mov ah,4ch
int 21h

accept proc near
mov ah,01h
int 21h
cmp al,3Ah
jc d1
sub al,07h
d1:and al,0Fh
rol al,04h
mov bh,al
mov ah,01h
int 21h
cmp al,3Ah
jc d2
sub al,07h
d2:and al,0Fh
add al,bh
mov [si],al
ret
endp

findMax proc near
mov bl,04h
lea si,arr1
s1:mov al,[si]
cmp al,ch
jl s2
mov ch,al
s2:inc si
dec bl
jnz s1
ret
endp

disp proc near
mov bh,bl
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d3
add bh,07h
d3:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,bl
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
