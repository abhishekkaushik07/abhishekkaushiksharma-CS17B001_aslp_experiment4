.data
arr1:  	.space 5
arr1sz: .byte 5		#using as array  of integers
arr2:   .space 5
arr2sz: .byte 5

.text
main:
lb $s1,arr1sz
lb $s2,arr2sz
la $t1,arr1
la $t2,arr2
move $s5,$t1
move $s6,$t2
li $t3,'a' # to fill array
li $t4,'j' #to fill array
li $t5,1
li $t7,1 #final iteration for swapping

iterate:
beq $t5,$s1,swap
addi $t5,$t5,1
sb $t3,0($t1)
sb  $t4,0($t2)
addi $t3,$t3,1
addi $t4,$t4,1
addi $t1,$t1,1
addi $t2,$t2,1
j iterate

swap:
beq  $t7,$s1,END
lb $t4,0($s5)
lb $t5,0($s6)
sb $t5,0($s5)
sb $t4,0($s6)
addi $s5,$s5,1
addi $s6,$s6,1
addi $t7,$t7,1
b swap



