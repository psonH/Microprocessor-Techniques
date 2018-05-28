mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db 0Ah,0Dh,"Enter a number:$"
msg2 db 0Ah,0Dh,"Number is prime.$"
msg3 db 0Ah,0Dh,"Number is composite.$"
num db 00h
.code
mov ax,@data
mov ds,ax

;accepting the number
mess msg1
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

mov num,bh

              ;checking for 01h,02h,03h
cmp bh,01h
jle l3
cmp bh,03h
jle l2

mov ah,00h
mov al,num
mov cl,02h
div cl
mov cl,al     ;storing quotient in cl


l1:mov ah,00h ;actual logic for prime
mov al,num
div cl
cmp ah,00h
jz l3
dec cl
cmp cl,01h
jne l1
jmp l2

l2:mess msg2
jmp exit

l3:mess msg3
exit:
mov ah,4ch
int 21h
end
