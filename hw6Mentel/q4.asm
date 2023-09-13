.data #declare variables
date1: .word  0x010F0903 #September 2015
date2: .word 0x0063010F #January 1999

.text
main:
	lw $t0, date1 #load dates into main
	lw $t1, date2
	
	slt $t2, $t0, $t1 #determine which date is greater
	bne $t2, $0, dateLater
	sw $t0, date2 #store greater case: date2
	j done
	
	dateLater: 
	sw $t1, date1  #store greater case: date1
	
	done: