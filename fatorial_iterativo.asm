.data
$LC0: .ascii "Digite um valor para n: \0"
.text
main:  la $4, $LC0      # load address of string at $LC0 into register $a0
       jal printstring  # call the printstring subroutine with $a0 as the argument
       jal scanf
       move $4,$2
       jal fatint
       jal printf
       jr $31
fatint:addi $8,$0,1
$L1:   slt $9,$4,$8
       bne $9,$0,$L2
       mult $8,$2
       mflo $2
       addiu $8,$8,1
       b $L1
$L2:   move $4,$2
       jr $31
printstring:
  li $v0, 4   # li means load immediate. This instruction is the same as addi $v0, $zero, 4
  syscall     # make a syscall to print the string at $a0 in console window
              # ($v0=4 tells the system call to print the characters that are at address $a0 to console)
  jr $ra
printf:
  li $v0, 1   # li means load immediate. This instruction is the same as addi $v0, $zero, 1
  syscall     # make a syscall to print an integer at $a0 in console window
              # ($v0=1 tells the system call to print an integer that are at address $a0 to console)
  jr $ra
scanf:
  li $v0, 5   # li means load immediate. This instruction is the same as addi $v0, $zero, 
  syscall     # make a syscall to read an integer at $v0 in console window
              # ($v0=5 tells the system call to read an integer from console and put at address $v0)
  jr $ra
