main:

#mask at 31th bit

lui $s0,32768 
li $t0,16 		#give input here
and $t1,$t0,$s0
bne $t1,$0,L1
li $v0,0
j Exit

L1:
li $v0,1

Exit:

