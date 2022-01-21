.data
$LC0: .ascii "Digite um valor para n: \0"

.text
main:
la $a0, $LC0      # load address of string at $LC0 into register $a0
jal printstring  # call the printstring subroutine with $a0 as the argument
jal scanf
move $a0,$v0
jal fat
mflo $a0
jal printf
jr $ra

fat:
addi $sp, $sp, -8  # make room
sw   $a0, 4($sp)   # store $a0
sw   $ra, 0($sp)   # store $ra
addi $t0, $0, 2    
slt  $t0, $a0, $t0 # a <= 1 ?
beq  $t0, $0, else # no: go to else  
addi $v0, $0, 1    # yes: return 1
addi $sp, $sp, 8   # restore $sp
jr   $ra           # return

else:
addi $a0, $a0, -1  # n = n - 1
jal  fat           # recursive call
lw   $ra, 0($sp)   # restore $ra
lw   $a0, 4($sp)   # restore $a0
addi $sp, $sp, 8   # restore $sp
mul  $v0, $a0, $v0 # n * factorial(n-1)
jr   $ra           # return

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
li $v0, 5   # li means load immediate. This instruction is the same as addi $v0, $zero, 1
syscall     # make a syscall to read an integer at $v0 in console window
            # ($v0=5 tells the system call to read an integer from console and put at address $v0)
jr $ra
