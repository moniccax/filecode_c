.text
addi 	$s0, $zero, -10
addi 	$s1, $zero, 0x0F
add 	$s2, $s0, $s1
addiu 	$s3, $s1, 0xFFFFFFF2
addu 	$s4, $s2, $s3
sub 	$s5, $s0, $s2
addi	$t0, $zero, 0x1001000C
sw	$s5, 16($t0)
sll	$t1, $t0, 4
or	$t2, $t1, $s1
andi	$t3, $t2, 3
bne	$t2, $t3, desvio1
andi	$t3, $t2, 3
desvio1:
sltiu	$t4, $t3, -10
beq	$t4, $zero, desvio2
desvio2:
lb	$t5, 16($t0)
j	desvio3
lb	$t5, 17($t0)
desvio3:
lb	$t6, 18($t0)
lbu	$t7, 16($t0)
addu	$s6, $t6, $t7
sb	$s6, 4($t0)
sb	$s6, 5($t0)
sb	$s6, 6($t0)
lui	$s7, 0xFFFF
ori	$s7, $s7, 0xFFF0
