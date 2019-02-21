main :
li $s0,15 
li $v0,0 #for counting 1

while:
beq $s0,$0,Exit
andi $t2,$s0,1
srl $s0,$s0,1
beq $t2,0,while
addi $v0,$v0,1
j while

Exit:

addi $v1,$v0,-32
sub $v1,$0,$v1  #v1 counts 0