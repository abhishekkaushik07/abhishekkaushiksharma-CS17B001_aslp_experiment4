        .data
ans:    .space 20                #reserve a block of 4 bytes each (1 byte =8 bit)     
 
.text
main:
li $t0,4294967295                #  $t0 =2 power 32- 1    $t0 to $t3 accomadets 128 bit number(first)
li $t1,2147483648
li $t2,4294967295  
li $t3,2147483648
li $t4,2147483648                # $t1=2 power 31         $t4 to $t7 accomadets 128 bit number(second)
li $t5,4294967295  
li $t6,2147483648
li $t7,4294967295   
li $t8,0                         #carry out at each 32 bit's sum
li $s4,0                         #final carry out
li $s0,0                         #for $t0 + $t4 (store sum of first 32 bit of each number)
li $s1,0                         #for $t1 + $t5(sum of 32-64 bit)
li $s2,0                         #for $t2 + $t6(sum of 64-96 bit)
li $s3,0                         #for $t3 + $t7(sum of 96-128 bit)
la $s5,ans				


addu  $s0,$t0,$t4                # adding 1st 32bit from right and keeping in $s0
sltu  $t8,$s0,$t4                # check for carry out
addu  $t1,$t1,$t8                # add carry to $t1
addu  $s1,$t1,$t5                
sltu  $t8,$s1,$t5                #check for carry out
addu  $t2,$t2,$t8
addu  $s2,$t2,$t6
sltu  $t8,$s2,$t6                #check for carry out
addu  $t3,$t3,$t8
addu  $s3,$t3,$t7
sltu  $s4,$s3,$t7                #check for carry out



li    $t0,0	                 # set $t == 0                
sw    $s4,ans($t0)               # storing final resultant sum into array ans
addi  $t0,$t0,4
sw    $s3,ans($t0)
addi  $t0,$t0,4
sw    $s2,ans($t0)
addi  $t0,$t0,4
sw    $s1,ans($t0)
addi  $t0,$t0,4
sw    $s0,ans($t0)





jr $ra  
.end main 
