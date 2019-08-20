	.data
input: .asciiz "Enter input n: "
str:.asciiz ","
	.text
	.globl main

main:
	li $v0, 4
	la $a0, input
	syscall

	li $v0, 5
	syscall
	# addi $t2, $0, 10 #set input n here

	la $a2, str


	addi $t1, $0, 1
	addi $t2, $v0, 1

L1:
	move $a1, $t1
	jal fib

	#print result counter
	add $a0, $0, $v1
	addi $v0, $0, 1
	syscall
	#print ','
	addi $v0, $0, 4
	la $a0, str
	syscall

	addi $t1, $t1, 1
	blt $t1, $t2, L1


	addi $v0, $0, 10
	syscall


fib:

	bgt $a1, 2, fib_rec
	bgt $a1, 0, base_case
	move $v1, $0
	jr $ra

base_case:
	addi $v1, $0, 1
	jr $ra

fib_rec:
	sub $sp, $sp, 12
	sw $ra, 0($sp)

	sw $a1, 4($sp)
	addi $a1, $a1, -1
	jal fib

	lw $a1, 4($sp)
	sw $v1, 8($sp)

	add $a1, $a1, -2
	jal fib

	lw $t0, 8($sp)
	add $v1, $t0, $v1

	lw $ra, 0($sp)
	add $sp, $sp, 12

	jr $ra