.data
arr1:  	.space 20
arr1sz: .word 5		#using as array  of integers
arr2:   .space 20
arr2sz: .word 5

.text
main:
lw $s1,arr1sz
lw $s2,arr2sz
la $t1,arr1
la $t2,arr2
move $s5,$t1
move $s6,$t2
li $t3,1 # to fill array
li $t4,6 #to fill array
li $t5,1
li $t7,1 #final iteration for swapping

iterate:
beq $t5,$s1,swap
addi $t5,$t5,1
sw $t3,0($t1)
sw  $t4,0($t2)
addi $t3,$t3,1
addi $t4,$t4,1
addi $t1,$t1,4
addi $t2,$t2,4
j iterate

swap:
beq  $t7,$s1,END
lw $t4,0($s5)
sw $s6,0($s5)
sw $t4,0($s6)
addi $s5,$s5,4
addi $s6,$s6,4
addi $t7,$t7,1
b swap



