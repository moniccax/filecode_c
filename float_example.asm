.data
.word 0x40a00000 # 5.0 na notação IEEE-754 precisão simples
.word 0x41100000 # 9.0 na notação IEEE-754 precisão simples
.word 0x42000000 # 32.0 na notação IEEE-754 precisão simples
.text
f2c:
	la $t1, 0x10010000
	lwc1  $f16, 0($t1)
	lwc1  $f18, 4($t1)
	div.s $f16, $f16, $f18
	lwc1  $f18, 8($t1)
	sub.s $f18, $f0, $f18
	mul.s $f12,  $f16, $f18
	jr    $ra
