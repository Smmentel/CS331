main:
  addi $s0, $0, 1 	#store 1 in $s0
  addi $s1, $0, 2	#store 2 in $s1
  lui $t4, 0x1001 	#store base address in $t4
  addi $a0, $0, 5 	# add 5 to $a0

  addi $sp, $sp, -12    # make space on stack
                        # to store 3 registers
  sw   $ra, 8($sp)      # save $ra on stack                
  sw   $s0, 4($sp)      # save $s0 on stack
  sw   $s1, 0($sp)      # save $s1 on stack
  
		jal setArray 	#jump to setArray = setArray (5);
endLoop:
  lw   $s1, 0($sp)      # restore $s1 from stack
  lw   $s0, 4($sp)      # restore $s0 from stack
  lw   $ra, 8($sp)      # restore $ra from stack
  addi $sp, $sp, 12     # deallocate stack space
  
		j done          #jump to done

setArray: 
  add $s0, $0, $0 	#holds value of i
  addi $s1, $0, 5 	#holds max iterations
  addi $a0, $0, 5       #holds num  to be sent to compare
             # array base address = $s2
  lui  $s2, 0x1234      # 0x1234 in upper half of $S2
  ori  $s2, $s2, 0x8000 # 0x8000 in lower half of $s2
  

  for: beq $s0, $s1 endLoop
       sll $t0, $s0, 2 # $t0=i * 4
       add $t0, $t0, $s2 # addr of arr[i]
       lw $a1, 0($t0) # $a1=arr[i]
        jal compare
        sw $v0, 0($t0) # arr[i] = return  value
       addi $s0, $s0, 1
       j for
  
 		 jr   $ra         # return to caller
 
 compare:
 slt $v0,$v0,$0          #$v0=1 if sub(a,b) < 0 (return 0)
 slti $v0,$v0,1          #$v0=1 if sub(a,b)>=0, else $v0 = 0
 	jr $ra
 
 done: