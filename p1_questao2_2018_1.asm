.data  
.word -1
.word -50
.word 325
.word 974                                         # (até aqui +2 pontos)
.text
main:   lui $s3, 0x7FFF
             ori $s3, $s3, 0xFFFF
             lui $s6, 0x1001
             lui $s4, 0x8000                   # (até aqui +2 pontos)
             addi $s1, $0, 0
             addi $t0, $0, 4
for1:    slt $t1,$s1,$t0
             beq $t1,$0, fimfor1          # (até aqui +2 pontos)
             sll $t1, $s1, 2
             add $t1, $s6, $t1
             lw $t2, 0($t1)                     # (até aqui +2 pontos)
             slt $t1, $s4, $t2
             beq $t1, $0, fimif1
             add $s4, $t2, $0  
fimif1: slt $t1, $t2, $s3                  # (até aqui + 2 pontos)
             beq $t1, $0, fimif2
             add $s3, $t2, $0
fimif2: addi $s1, $s1, 1                 # (até aqui +2 pontos)
             j for1
fimfor1: sub $s2, $s4, $s3
             sw $s2, 0($s5)                    # (até aqui +2 pontos)
             add $v0, $0, $0                  
             jr $ra                                    # (até aqui +1 ponto)
