mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
arr1 db 0Ah,?,0Ah dup('$')
arr2 db 0Ah,?,0Ah dup('$')
msg1 db 0Ah,0Dh,"Enter the 1st string:"
msg2 db 0Ah,0Dh,"Enter the 2nd string:"
msg3 db 0Ah,0Dh,"The strings are unequal."
msg4 db 0Ah,0Dh,"The strings are equal."
leng1 db 00h
leng2 db 00h
.code
mov ax,@data
mov ds,ax

mess msg1
lea si,arr1
mov dx,si
mov ah,0Ah
int 21h

mess msg2
lea si,arr2
mov dx,si
mov ah,0Ah
int 21h

lea si,arr1
mov bh,[si+01h]
mov leng1,bh

lea si,arr2
mov bh,[si+01h]
mov leng2,bh

mov bh,leng1
mov ah,leng2
cmp ah,bh
jnz unequal

lea si,[arr1+02h]
lea di,[arr2+02h]
cld
repe cmpsb
;jne unequal

equal:mess msg4
jmp exit

unequal:
mess msg3

exit:mov ah,4Ch
int 21h
end

