	.data
str:.ascii "Numbers are 0, 25 and 123 for this."
	
	.text
	.globl main

main:
	la $a0, str;
	jal func1

	#print result counter
	add $a0, $0, $v0
	addi $v0, $0, 1
	syscall
	addi $v0, $0, 10
	syscall

func1:
	#$a0 points to start of input string

	add $t0, $0, $a0
	add $v0, $0, $0		#initialize result counter

L1:	
	lbu $t1, 0($t0)
	beq $t1, $0, L3

	#check if char is a digit: ASCII code 0x30 to 0x3A
	slti $t2, $t1, 0x30
	bne $t2, $0, L2
	slti $t2, $t1, 0x3A
	beq $t2, $0, L2

	#increment counter
	addi $v0, $v0, 1

L2:
	addi $t0, $t0, 1
	j L1

L3:
	jr $ra



