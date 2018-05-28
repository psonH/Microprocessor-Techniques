mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
arr1 db 08h,?,08h dup('$')
arr2 db 08h,?,08h dup('$')
msg1 db 0Ah,0Dh,"Enter the array 1:$"
msg2 db 0Ah,0Dh,"Enter the array 2:$"
msg3 db 0Ah,0Dh,"The sum of arrays:$"
msg4 db ",$"

.code
mov ax,@data
mov ds,ax
mov es,ax

mess msg1
lea si,arr1
mov cl,08h
l1:mov ah,01h
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
mess msg4
inc si
dec cl
jnz l1

mess msg2
lea si,arr2
mov cl,08h
l2:mov ah,01h
int 21h
mov bh,al
cmp bh,3Ah
jc d3
sub bh,07h
d3:and bh,0Fh
rol bh,04h
mov ah,01h
int 21h
cmp al,3Ah
jc d4
sub al,07h
d4:and al,0Fh
add bh,al
mov [si],bh
mess msg4
inc si
dec cl
jnz l2

lea si,arr1
lea di,arr2
mov cl,08h
l3:mov bh,[si]
mov bl,[di]
add bh,bl
mov [si],bh
inc si
inc di
dec cl
jnz l3

mess msg3
lea si,arr1
mov cl,08h
l4:mov bh,[si]
and bh,0F0h
rol bh,04h
cmp bh,0Ah
jc d5
add bh,07h
d5:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mov bh,[si]
and bh,0Fh
cmp bh,0Ah
jc d6
add bh,07h
d6:add bh,30h
mov dl,bh
mov ah,02h
int 21h
mess msg4
inc si
dec cl
jnz l4

mov ah,4ch
int 21h
end
