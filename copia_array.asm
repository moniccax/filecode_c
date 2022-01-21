	.data
copia:	.space	32
vetor:	.word	3, 5, 1, 7, 9, 6, 8, 2

	.text

main:
	la	$a0, copia
	la	$a1, vetor
	li	$a2, 8
	jal	copy_array		

	move	$a0, $v0	# obter o resultado e imprimi-lo
	li	$v0, 1
	syscall

	li	$v0, 10		# system call for exit
	syscall			# exit

copy_array:
	move	$t0, $0
loop:
	beq	$t0, $a2, done
	sll	$t1, $t0, 2
	add	$t2, $t1, $a1
	lw	$t2, 0($t2)
	add	$t1, $t1, $a0
	sw	$t2, 0($t1)
	addi	$t0, $t0, 1
	b	loop
done:
	jr	$ra