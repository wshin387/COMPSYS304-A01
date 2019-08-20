	.data	
	.text
	.globl main

main:
	addi $t0, $0, 2767
	#addi $t1, $0, 0x9E00
	sw $t0, 0($t0)

	lb $t1, 3($t0)




	#print result counter
	add $a0, $0, $t1
	addi $v0, $0, 1
	syscall
	addi $v0, $0, 10
	syscall