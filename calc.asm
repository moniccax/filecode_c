	.data
i:	.word	0	# reservar espaço para i
vetor:	.word	0:21	# idem, para vetor
	.text
calc:	addi	$sp, $sp, -20	# espaço na pilha
	sw	$ra, 16($sp)	# salvar $ra
	sw	$a0, 12($sp)	# salvar $a0
	sw	$s0, 8($sp)	# salvar $s0
	sw	$s1, 4($sp)	# salvar $s1
	sw	$s1, 0($sp)	# salvar $s2
	li	$s0, 0		# i = 0
	move	$s1, $a0
	la	$s2, vetor	# $s1 = end(vetor)
#	ori	$s1, vetor
loop:
	move	$a0, $s0	# primeiro argumento
	move	$a1, $s1	# segundo argumento
	jal	func		# chamar func
	sll	$t0, $s0, 2	# temp = 4*i
	add	$t1, $s2, $t0	# calcular ponteiro
	sw	$v0, 0($t1)	# vetor[i] = resultado
	addi	$s0, $s0, 1	# i = i+1
	slti	$t0, $s0, 21	# i < 21?
	bne	$t0, $zero, loop	  # sim, continuar

fim:	lw	$s2, 0($sp)	# restaurar $s1
	lw	$s1, 4($sp)	# restaurar $s0
	lw	$s0, 8($sp)	# restaurar $s0
	lw	$a0, 12($sp)	# restaurar $a0
	lw	$ra, 16($sp)	# restaurar $ra
	addi	$sp, $sp, 20
	jr	$ra

func:	slti	$t0, $a1, 6		# testar se p < 6
	beq	$t0, $zero, else	# não, ir para else
	add	$v0, $a0, $a1	# calcular x+p
	jr	$ra			# retornar
else:	addi	$v0, $a0, 5		# calcular x+5
	jr	$ra
