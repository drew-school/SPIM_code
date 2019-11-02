# Homework 7 Program 1, Arranging Numbers in Order
		
		.text
main:	la $t0,num1
		la $t7,num1
loop: 	lw $t1,0($t0) 		# Load first two numbers
		lw $t2,4($t0)
		beqz $t2,print 		# If the number = 0, done
		ble $t1,$t2,incr 	# If in correct order, get next
		jal swap 			# not in correct order - go to swap
		j loop 				# get next number
incr: 	addi $t0,$t0,4 		# Increment current address
		j loop
print: 	lw $a0,($t7) 		# Print loop
		beqz $a0,done
		li $v0,1
		syscall
		li $a0,0x0a
		li $v0,11
		syscall
		addi $t7,$t7,4
		j print
done:	li $v0,10 			# end program.
		syscall
		
		# number swap
swap: 	sub $sp,$sp,4 		# push stack
		sw $ra,($sp)
		sw $t1,4($t0) 		# swap two numbers
		sw $t2,0($t0)
		beq $t0,$t7,goback 	# If at first number position, done
		sub $t0,$t0,4
		lw $t1,0($t0) 		# Compare numbers to check if done
		lw $t2,4($t0)
		ble $t1,$t2,goback 	# If letter is properly placed, done
		jal swap 			# Not done yet - move back another position
goback: addi $t0,$t0,4 		# in correct position, unwind
		lw $ra,($sp)		# pop stack
		addi $sp,$sp,4
		jr $ra
		
		.data
num1: 	.word 53875
num2: 	.word 36429
num3: 	.word 88641
num4: 	.word 95437
num5: 	.word 25153
num6: 	.word 42398
num7: 	.word 0