.data
newline:	.asciiz "\n"			#label new line character

arrayBin:	.word 0:16			#initialize an array of sixteen characters to zero
		  
quadMinMixer:	.asciiz "QuadMinMixer = "	#label QuadMinMixer string
		  
quadBitCipher:	.asciiz "QuadBitCipher = "	#label QuadBitCipher string
.text

main:
	li $v0, 5				#prompt user for input x
	syscall
	move $a0, $v0
	
	li $v0, 5				#prompt user for input y
	syscall
	move $a1, $v0
	
	jal QuadMinMixer			#call QuadMinMixer function
	
	li $v0, 4				#print QuadMinMixer string
	la $a0, quadMinMixer
	syscall
	
	li $v0, 34				#print returned value in hexadecimal
	move $a0, $t0
	syscall
	
	li $v0, 4				#print new line
	la $a0, newline
	syscall
	
	jal QuadBitCipher			#call QuadBitCipher function
	
	li $v0, 4				#print QuadBitCipher string
	la $a0, quadBitCipher
	syscall
	
	addi $t0, $zero, 60			#load 60 into register $t0
	
	lw $t1, arrayBin($t0)			#load final integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load fifteenth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load fourteenth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load thirteenth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load twelfth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load eleventh integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load tenth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load ninth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load eigth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load seventh integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load sixth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load fifth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load fourth integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load third integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load second integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	addi $t0, $t0, -4			#decrement $t0 by four
	
	lw $t1, arrayBin($t0)			#load first integer in array to $t1
	li $v0, 1				#print integer
	addi $a0, $t1, 0
	syscall
	
exit:	
	li $v0, 10				#exit program
	syscall
		
QuadMinMixer:	
	addi $sp, $sp, -4			#create space at ToS for return address
	sw $ra, 0($sp)				#store return address at ToS

	addi $t0, $zero, 0			#initialize $t0 to zero
	addi $t3, $zero, 4026531840		#initialize $t3 to 1111 0000 0000 0000 0000 0000 0000 0000
	
loop:
	beq $t3, 0, continue			#if $t3 is equal to zero, branch to continue1, otherwise loop again
	and $t1, $a0, $t3			#mask x with $t3 to isolate four-bit field
	and $t2, $a1, $t3			#mask y with $t3 to isolate four-bit field
	blt $t1, $t2, getSmaller		#check to see if x is smaller than y
	add $t0, $t0, $t2			#if not, add masked y value to $t0
	srl $t3, $t3, 4				#move four-bit masking field to the right four bits
	j loop					#begin next iteration of loop
	
getSmaller:
	add $t0, $t0, $t1			#add masked x value to $t0 if it is smaller than masked y value
	srl $t3, $t3, 4				#move four-bit masking field to the right four bits
	j loop					#begin next iteration of loop

continue:
	lw $ra, 0($sp)				#restore $ra
	addi $sp, $sp, 4			#clear the stack
	
	jr $ra					#return
	
QuadBitCipher:
	addi $sp, $sp, -4			#create space at ToS for return address
	sw $ra, 0($sp)				#store return address at ToS
	
	addi $t1, $zero, 26			#initialize $t1 to 26
	addi $t3, $zero, 4026531840		#initialize $t3 to 1111 0000 0000 0000 0000 0000 0000 0000
	
	and $t2, $t0, $t3			#mask QuadMinMixer(x, y) with $t3 and load the value to $t2
	srlv $t2, $t2, $t1			#shift $t2 right by $t1 bits 
	lw $t4, arrayBin($t2)			#load in value stored at $t2 in the array to $t4
	addi $t4, $t4, 1			#increment value
	sw $t4, arrayBin($t2)			#store it back in same spot in array
	srl $t3, $t3, 4				#move four-bit masking field to the right four bits
	addi $t1, $t1, -4			#decrement $t1 by four
	
	and $t2, $t0, $t3			#mask QuadMinMixer(x, y) with $t3 and load the value to $t2
	srlv $t2, $t2, $t1			#shift $t2 right by $t1 bits 
	lw $t4, arrayBin($t2)			#load in value stored at $t2 in the array to $t4
	addi $t4, $t4, 1			#increment value
	sw $t4, arrayBin($t2)			#store it back in same spot in array
	srl $t3, $t3, 4				#move four-bit masking field to the right four bits
	addi $t1, $t1, -4			#decrement $t1 by four
	
	and $t2, $t0, $t3			#mask QuadMinMixer(x, y) with $t3 and load the value to $t2
	srlv $t2, $t2, $t1			#shift $t2 right by $t1 bits 
	lw $t4, arrayBin($t2)			#load in value stored at $t2 in the array to $t4
	addi $t4, $t4, 1			#increment value
	sw $t4, arrayBin($t2)			#store it back in same spot in array
	srl $t3, $t3, 4				#move four-bit masking field to the right four bits
	addi $t1, $t1, -4			#decrement $t1 by four
	
	and $t2, $t0, $t3			#mask QuadMinMixer(x, y) with $t3 and load the value to $t2
	srlv $t2, $t2, $t1			#shift $t2 right by $t1 bits 
	lw $t4, arrayBin($t2)			#load in value stored at $t2 in the array to $t4
	addi $t4, $t4, 1			#increment value
	sw $t4, arrayBin($t2)			#store it back in same spot in array
	srl $t3, $t3, 4				#move four-bit masking field to the right four bits
	addi $t1, $t1, -4			#decrement $t1 by four
	
	and $t2, $t0, $t3			#mask QuadMinMixer(x, y) with $t3 and load the value to $t2
	srlv $t2, $t2, $t1			#shift $t2 right by $t1 bits 
	lw $t4, arrayBin($t2)			#load in value stored at $t2 in the array to $t4
	addi $t4, $t4, 1			#increment value
	sw $t4, arrayBin($t2)			#store it back in same spot in array
	srl $t3, $t3, 4				#move four-bit masking field to the right four bits
	addi $t1, $t1, -4			#decrement $t1 by four
	
	and $t2, $t0, $t3			#mask QuadMinMixer(x, y) with $t3 and load the value to $t2
	srlv $t2, $t2, $t1			#shift $t2 right by $t1 bits 
	lw $t4, arrayBin($t2)			#load in value stored at $t2 in the array to $t4
	addi $t4, $t4, 1			#increment value
	sw $t4, arrayBin($t2)			#store it back in same spot in array
	srl $t3, $t3, 4				#move four-bit masking field to the right four bits
	addi $t1, $t1, -4			#decrement $t1 by four
	
	and $t2, $t0, $t3			#mask QuadMinMixer(x, y) with $t3 and load the value to $t2
	srlv $t2, $t2, $t1			#shift $t2 right by $t1 bits 
	lw $t4, arrayBin($t2)			#load in value stored at $t2 in the array to $t4
	addi $t4, $t4, 1			#increment value
	sw $t4, arrayBin($t2)			#store it back in same spot in array
	srl $t3, $t3, 4				#move four-bit masking field to the right four bits
	
	and $t2, $t0, $t3			#mask QuadMinMixer(x, y) with $t3 and load the value to $t2
	sll $t2, $t2, 2				#shift $t2 left by 2 bits
	lw $t4, arrayBin($t2)			#load in value stored at $t2 in the array to $t4
	addi $t4, $t4, 1			#increment value
	sw $t4, arrayBin($t2)			#store it back in same spot in array

	lw $ra, 0($sp)				#restore $ra
	addi $sp, $sp, 4			#clear the stack
	
	jr $ra					#return
