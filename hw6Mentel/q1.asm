#1. #a=1, b=5  
addi $t0, $0, 1
addi $t1, $0, 5

add  $s0, $0, $0 #i and j
add  $s1, $0, $0 
    
lui $s2, 0x0000 #load  array $s2=D 
ori $s2, $s2, 0x0000

#for loops
for: slt $t2, $s0, $t0
     beq $t2, $0, done
     loop: slt $t3, $s1, $t2
           beq $t2, $0, done
          
           add $t5, $s0, $s1     #i + j
       
           sll $t4, $s1, 2       #4*j
           
           add $t6, $s2, $t4     #store in array 
           sw $t5,($t6) 
           
           addi  $s0, $s0, 1     #increment loops and jump 
           j loop
           
           addi $s1, $s1, 1
           j for
done:
        