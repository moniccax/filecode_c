.data
.word 0xFFAAD120
.word 0x048FF2F0
.word 0xA00B1CD1
.word 0x7701C106
.word 0x5F1BA232
.word 0x10050607
.word 0x123456A1
.word 0x00F34F11
.text
                  add $s0, $0, $0
                  addi $s1, $0, 10
                  lui $s0, 0x1001
                  ori $s0, $s0, 0x0014
                  lui $s2, 0x7FFF
                  lw $t0, 8($s0)
                  sll $t1, $t0, 8
                  ori $t2, $s2, 0xFFFF
                  xor $t3, $t2, $t1
desvio1:     lb $t4, 6($s0)
                  lb $t1, 8($s0)
                  add $t0, $t0, $t1
                  sb $t0, 11($s0)
                  sra $t1, $t0, 4
                  beq $t0, $t1, desvio1
                  addi $t0, $t0, 0x002A
                  lb $t1, 0($s0)
                  sw $t0, -4($s0)
                  jr $ra
