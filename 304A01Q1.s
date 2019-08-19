	addi $t6, $0, 2048

L1:
	#Load bytes into separate registers
	lb $t2, 0($t0)
	lb $t3, 1($t0)
	lb $t4, 2($t0)
	lb $t5, 3($t0)

	# Assume that lb loads the byte into LEAST SIGNIFICANT byte
	sll $t3, $t3, 8
	sll $t4, $t4, 16
	sll $t5, $t5, 24

	# Create word in little endian
	add $t5, $t4, $t5
	add $t5, $t3, $t5
	add $t5, $t2, $t5

	# Divide by 16 and store in new array
	sra $t5, $t5, 4
	sw $t5, 0($t1)

	# Increment counters
	addi $t0, $t0, 4
	addi $t6, $t6, -1
	addi $t1, $t1, 4
	bne $t6, $0, L1



