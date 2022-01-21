fat(int):
  addiu $sp,$sp,-24
  sw $fp,20($sp)
  move $fp,$sp
  sw $4,24($fp)
  li $2,1 # 0x1
  sw $2,8($fp)
  li $2,1 # 0x1
  sw $2,12($fp)
$L3:
  lw $3,12($fp)
  lw $2,24($fp)
  slt $2,$2,$3
  bne $2,$0,$L2
  lw $3,8($fp)
  lw $2,12($fp)
  mult $3,$2
  mflo $2
  sw $2,8($fp)
  lw $2,12($fp)
  addiu $2,$2,1
  sw $2,12($fp)
  b $L3
$L2:
  lw $2,8($fp)
  move $sp,$fp
  lw $fp,20($sp)
  addiu $sp,$sp,24
  j $31
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
  la $4,$LC0
  jal printf
  addiu $2,$fp,24
  move $5,$2
  la $4,$LC1
  jal scanf
  lw $16,24($fp)
  lw $2,24($fp)
  move $4,$2
  jal fat(int)
  move $6,$2
  move $5,$16
  la $4,$LC2
  jal printf
  move $2,$0
  move $sp,$fp
  lw $31,44($sp)
  lw $fp,40($sp)
  lw $16,36($sp)
  addiu $sp,$sp,48
  j $31