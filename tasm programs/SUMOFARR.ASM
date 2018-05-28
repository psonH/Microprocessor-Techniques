mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter the 1st array:$"
msg2 db 0Ah,0Dh,"Enter the 2nd array:$"
msg3 db 0Ah,0Dh,"The sum of array:$"
msg4 db 0Ah,0Dh,"Enter number:$"
arr1 db 08h,?,08h dup('$')
arr2 db 08h,?,08h dup('$')
arr3 db 08h,?,08h dup('$')
arr db 08h,?,08h dup('$')
.code
mov ax,@data
mov ds,ax

mess msg1
call accept


accept proc near
lea si,arr
mov cl,04h
l1:mess msg4
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
ret
endp


