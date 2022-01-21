fat(int):
  addiu $sp,$sp,-32
  sw $31,28($sp)
  sw $fp,24($sp)
  move $fp,$sp
  sw $4,32($fp)
  lw $2,32($fp)
  nop
  beq $2,$0,$L2
  nop

  lw $2,32($fp)
  nop
  addiu $2,$2,-1
  move $4,$2
  jal fat(int)
  nop

  move $3,$2
  lw $2,32($fp)
  nop
  mult $3,$2
  mflo $2
  b $L3
  nop

$L2:
  li $2,1 # 0x1
$L3:
  move $sp,$fp
  lw $31,28($sp)
  lw $fp,24($sp)
  addiu $sp,$sp,32
  j $31
  nop

$LC0:
  .ascii "\012\012Digite um valor para n: \000"
$LC1:
  .ascii "%d\000"
$LC2:
  .ascii "\012O fatorial de %d e' %d\000"
main:
  addiu $sp,$sp,-48
  sw $31,44($sp)
  sw $fp,40($sp)
  sw $16,36($sp)
  move $fp,$sp
  lui $2,%hi($LC0)
  addiu $4,$2,%lo($LC0)
  jal printf
  nop

  addiu $2,$fp,24
  move $5,$2
  lui $2,%hi($LC1)
  addiu $4,$2,%lo($LC1)
  jal scanf
  nop

  lw $16,24($fp)
  lw $2,24($fp)
  nop
  move $4,$2
  jal fat(int)
  nop

  move $6,$2
  move $5,$16
  lui $2,%hi($LC2)
  addiu $4,$2,%lo($LC2)
  jal printf
  nop

  move $2,$0
  move $sp,$fp
  lw $31,44($sp)
  lw $fp,40($sp)
  lw $16,36($sp)
  addiu $sp,$sp,48
  j $31
  nop
  