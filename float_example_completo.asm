.data
.word 0x40a00000 # 5.0 na notação IEEE-754 precisão simples
.word 0x41100000 # 9.0 na notação IEEE-754 precisão simples
.word 0x42000000 # 32.0 na notação IEEE-754 precisão simples
$LC0: .ascii "Digite um valor float para n: \0"
.text
main:
	la $4, $LC0      # load address of string at $LC0 into register $a0
    jal printstring  # call the printstring subroutine with $a0 as the argument
f2c:
	la $t1, 0x10010000
	lwc1  $f16, 0($t1)
	lwc1  $f18, 4($t1)
	div.s $f16, $f16, $f18
	lwc1  $f18, 8($t1)
	jal scanf_float
	sub.s $f18, $f0, $f18
	mul.s $f12,  $f16, $f18
	jal printf_float
	jr    $ra

printstring:
	li $v0, 4   # li means load immediate. This instruction is the same as addi $v0, $zero, 4
	syscall     # make a syscall to print the string at $a0 in console window
				  # ($v0=4 tells the system call to print the characters that are at address $a0 to console)
	jr $ra
  
printf_float:
	li $v0, 2   # li means load immediate. This instruction is the same as addi $v0, $zero, 2
	syscall     # make a syscall to print a float number at $f12 in console window
				  # ($v0=2 tells the system call to print a floar number that are at address $f12 to console)
	jr $ra
	
scanf_float:
	li $v0, 6   # li means load immediate. This instruction is the same as addi $v0, $zero, 6
	syscall     # make a syscall to read a float at $f0 in console window
				  # ($v0=6 tells the system call to read a float number from console and put at address $f0)
	jr $ra
	