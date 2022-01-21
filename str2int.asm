	.data
string:	.asciiz		"010234"

	.text

main:
	la	$a0, string
	jal	str2int		

	move	$a0, $v0	# obter o resultado e imprimi-lo
	li	$v0, 1
	syscall

	li	$v0, 10		# system call for exit
	syscall			# exit

str2int:
	addi	$sp, $sp, -4
	sw	$ra, ($sp)
	add	$t6, $0, 0x30 # ‘0’
	add	$t7, $0, 0x39 # ‘9’
	add	$s0, $0, $0
	add	$t0, $a0, $0

LOOP:
	lb	$t1, ($t0)
	slt	$t2, $t1, $t6
	bne	$t2, $0, DONE
	slt	$t2, $t7, $t1
	bne	$t2, $0, DONE
	sub	$t1, $t1, $t6
	beq	$s0, $0, FIRST
	mul	$s0, $s0, 10
FIRST:
	add	$s0, $s0, $t1
	addi	$t0, $t0, 1
	j	LOOP
DONE:
	add	$v0, $s0, $0
	lw	$ra, ($sp)
	addi	$sp, $sp, 4
	jr	$ra