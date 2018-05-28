.model small
.data
n1 db 00h
.code
mov ax,@data
mov ds,ax
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
add al,bl
mov ah,4ch
int 21h
end
