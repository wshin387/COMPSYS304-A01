	#initialize registers
	addi $t0, $0, 0
	addi $t1, $0, 0
	add $t2, $0, $s0
	add $t3, $0, $s1
	addi $t5, $0, 5
	addi $t6, $0, 10
	mtc1 $0, $f0
	cvt.d.w $f0, $f0	#initialize $f0 as 0.0

L1:
	lwc1 $f2, 0($t2)
	lwc1 $f3, 4($t2)
	add.d $f0, $f0, $f2

	#convert int into double precision floating point
	lw $t4, 0($t3)
	mtc1 $t4, $f4
	cvt.d.w $f4, $f4
	add.d $f0, $f0, $f4

	addi $t1, $t1, 1
	addi $t3, $t3, 4
	addi $t2, $t2, 8
	bne $t1, $t5, L1

	add $t3, $0, $s1
	addi $t1, $0, 0
	addi $t0, $t0, 1
	bne $t0, $t6, L1


	#store result into $s2
	swc1 $f0, 0($s2)
	swc1 $f1, 4($s2)