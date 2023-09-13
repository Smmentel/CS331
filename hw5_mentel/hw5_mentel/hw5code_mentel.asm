
#Question 3
#f=g+(h-5) 

#addi $s1, $0, 20
#addi $s2, $0, 30

#addi $t0, $s1, -5
#add  $s0, $s1, $t0


#Question 4
#addi $s0, $0, 20
#addi $s1, $0, 30

#part a
#beq $s0, $s1, target
#add $s0,  $s0, $s1
#target:
#sub $s0,  $s0, $s1

#part b
#slt $t0, $s1, $s0
#beq $t0, $0, target
#addi $s1, $s1, -1
#target:
#addi $s0, $s0, 1

#part c 
#slt $t0, $s0, $s1
#beq $t0, $0, target 
#add $s1, $0, $0
#target:
#add $s0, $0, $0


#Question 5
#array base address $s0
lui $s0, 0x0000
ori $s0, $s0, 0x0000

lw $t1, 32($s0) #load  A[8]
addi $t1, $0, 11 #assign 11 to A[8]
sw $t1, 32($s0) #store value

lw $t2, 16($s0) #load A[4]
sw $t1, 16($s0) #store A[8] in A[4]























