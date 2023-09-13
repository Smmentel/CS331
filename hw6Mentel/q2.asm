#2. 
main:
# array base address = $a0
  lui  $a0, 0x1234        	# 0x1234 in upper half of $S0
  ori  $a0, $a0, 0x8000   	# 0x8000 in lower half of $s0

  lw   $t1, 0($a0)        	# $t1 = array[0]
  addi $t1, $0, 40        	# $t1 = $0 + 40
  sw   $t1, 0($a0)        	# array[0] = $t1

  lw   $t1, 4($a0)        	# $t1 = array[1]
  addi  $t1, $0, 42        	# $t1 = $0 + 42
  sw   $t1, 4($a0)        	# array[1] = $t1

  lw   $t1, 8($a0)        	# $t1 = array[2]
  addi  $t1, $0, 7        	# $t1 = $0 + 7
  sw   $t1, 8($a0)        	# array[2] = $t1
  
  #size is 3 = $a1
  addi $a1, $0, 3
  
  jal find42			#call function
  
find42: 
  addi $s0, $0, -1		#initialize return value
  
  addi $t0, $0, 0		#i=0
  #begin check of array 
  loop: slt $t1, $t0, $a1
  	beq $t1, $0, endLoop 
  	
  sll  $t2, $t0, 2        # $t2 = i * 4 
  add  $t2, $t2, $a0      # address of array[i]
  lw   $t3, 0($t2)        # $t3 = array[i]
  addi $t0, $t0, 1	  #increment i
  bne  $t3, 42, setValue  #end loop when  values are equal
   	
  setValue:
  add $s0, $t3, $0        #set return value if eqal
  j endLoop
  	
  endLoop:
  add $v0,$s0,$0	  #put return value in $v0
  jr  $ra		  #return to caller

done:
