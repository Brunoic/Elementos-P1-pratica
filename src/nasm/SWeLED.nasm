; Arquivo: SWeLED.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF


LOOP:
	leaw $52, %A
	movw %A, %D
    leaw $21185, %A
	movw (%A), %S
	leaw $128, %A
    andw %A, %S, %S
    addw %D, %S, %D
    leaw $21184, %A
    movw %D, (%A)

leaw $LOOP, %A
jmp
nop


