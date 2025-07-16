section .data
    vetor db 3, 8, 5, 1, 0
    tam equ 5
    espaco db '0', ' '

section .text
    global _start

_start:
    mov ecx, tam
    dec ecx

extern_loop:
    xor esi, esi

inner_loop:
    mov al, [vetor + esi]
    mov bl, [vetor + esi + 1]
    cmp al, bl
    jbe skip_swap
    mov [vetor + esi], bl
    mov [vetor + esi + 1], al

skip_swap:
    inc esi
    cmp esi, ecx
    jl inner_loop

    dec ecx
    jnz extern_loop

    mov esi, 0

print_loop:
    movzx eax, byte [vetor + esi]
    add al, '0'
    mov [espaco], al
    mov eax, 4
    mov ebx, 1
    mov ecx, espaco
    mov edx, 2
    int 0x80
    inc esi
    cmp esi, tam
    jl print_loop

    mov eax, 1
    xor ebx, ebx
    int 0x80
