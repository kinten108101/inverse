.data
rm:     .space 400
rm_inv: .space 400
det:    .space 400
test__inv__2__input:      .float 1.0, 2.0, 3.0, 4.0
test__inv__2__assertions: .float -2.0, 1.0, 1.5, -0.5
test__inv__3__input:      .float -3.0, 2.0, -5.0, -1.0, 0.0, -2.0, 3.0, -4.0, 1.0
test__inv__3__assertions: .float 1.333333333, -3.0, 0.666666666, 0.833333333, -2.0, 0.166666666, -0.666666666, 1.0, -0.333333333
test__inv__4__input:      .float 8.0, 2.0, 3.0, 4.0, 5.0, 1.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 2.0, 14.0, 1.0, 16.0
test__inv__4__assertions: .float 0.17638153, -0.042392127, -0.02043906, -0.0075700227, -0.02346707, -0.17032552, 0.114307344, 0.005299016, -0.13020439, 0.022710068, 0.11809235, -0.0673732, 0.0066237696, 0.15291446, -0.104844816, 0.06302044
test__inv__5__input:      .float 8.0, 2.0, 3.0, 4.0, 9.0, 5.0, 1.1, 7.0, 8.0, 1.0, 9.0, 10.0, 11.0, 12.0, 2.0, 4.0, 14.0, 23.0, 16.0, 3.0, 5.0, 6.0, 7.0, 8.0, 10.0
test__inv__5__assertions: .float 0.17257497, -0.020583782, 0.0591069, 0.00630378, -0.16697165, -0.042454053, -0.17467627, 0.11964323, -0.009005405, 0.034449246, 0.16814378, -0.0051459456, -0.11022331, 0.12657596, -0.16674294
.text
main:

	# test__inv__2
	
	la $t0, rm
	la $t1, test__inv__2__input
	lwc1 $f1, 0($t1)
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1)
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1)
	swc1 $f1, 8($t0)
	lwc1 $f1,12($t1)
	swc1 $f1,12($t0)
	jal inv__2
	la $t0, rm_inv
	la $t1, test__inv__2__assertions

	lwc1 $f0, 0($t0) # a

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 0($t1)
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 4($t0) # b

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 4($t1)
	c.eq.s $f0, $f1
	bc1f assertion_failed
	
	lwc1 $f0, 8($t0) # c

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 8($t1)
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 12($t0) # d

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 12($t1)
	c.eq.s $f0, $f1
	bc1f assertion_failed

	# test__inv__3

	la $t0, rm
	la $t1, test__inv__3__input
	lwc1 $f1, 0($t1)
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1)
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1)
	swc1 $f1, 8($t0)
	lwc1 $f1,12($t1)
	swc1 $f1,12($t0)
	lwc1 $f1,16($t1)
	swc1 $f1,16($t0)
	lwc1 $f1,20($t1)
	swc1 $f1,20($t0)
	lwc1 $f1,24($t1)
	swc1 $f1,24($t0)
	lwc1 $f1,28($t1)
	swc1 $f1,28($t0)
	lwc1 $f1,32($t1)
	swc1 $f1,32($t0)
	jal inv__3
	la $t0, rm_inv
	la $t1, test__inv__3__assertions
	
	lwc1 $f0, 0($t0) # a

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 0($t1)
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 4($t0) # b

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 4($t1) # b assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 8($t0) # c

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 8($t1) # c assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 12($t0) # d

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 12($t1) # d assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 16($t0) # e

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 16($t1) # e assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 20($t0) # f

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 20($t1) # f assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 24($t0) # g

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 24($t1) # g assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 28($t0) # h

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 28($t1) # h assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 32($t0) # i

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 32($t1) # i assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	# test__inv__4

	la $t0, rm
	la $t1, test__inv__4__input
	lwc1 $f1, 0($t1)
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1)
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1)
	swc1 $f1, 8($t0)
	lwc1 $f1,12($t1)
	swc1 $f1,12($t0)
	lwc1 $f1,16($t1)
	swc1 $f1,16($t0)
	lwc1 $f1,20($t1)
	swc1 $f1,20($t0)
	lwc1 $f1,24($t1)
	swc1 $f1,24($t0)
	lwc1 $f1,28($t1)
	swc1 $f1,28($t0)
	lwc1 $f1,32($t1)
	swc1 $f1,32($t0)
	lwc1 $f1,36($t1)
	swc1 $f1,36($t0)
	lwc1 $f1,40($t1)
	swc1 $f1,40($t0)
	lwc1 $f1,44($t1)
	swc1 $f1,44($t0)
	lwc1 $f1,48($t1)
	swc1 $f1,48($t0)
	lwc1 $f1,52($t1)
	swc1 $f1,52($t0)
	lwc1 $f1,56($t1)
	swc1 $f1,56($t0)
	lwc1 $f1,60($t1)
	swc1 $f1,60($t0)
	jal inv__4
	la $t0, rm_inv
	la $t1, test__inv__4__assertions
	
	lwc1 $f0, 0($t0) # a

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 0($t1)
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 4($t0) # b

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 4($t1) # b assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 8($t0) # c

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 8($t1) # c assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 12($t0) # d

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 12($t1) # d assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 16($t0) # e

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 16($t1) # e assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 20($t0) # f

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 20($t1) # f assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 24($t0) # g

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 24($t1) # g assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 28($t0) # h

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 28($t1) # h assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 32($t0) # i

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 32($t1) # i assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 36($t0) # j

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 36($t1) # j assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 40($t0) # k

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 40($t1) # k assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 44($t0) # l

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 44($t1) # l assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 48($t0) # m

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 48($t1) # m assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 52($t0) # n

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 52($t1) # n assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 56($t0) # o

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 56($t1) # o assert
	c.eq.s $f0, $f1
	bc1f assertion_failed
	
	lwc1 $f0, 60($t0) # p

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 60($t1) # p assert
	c.eq.s $f0, $f1
	bc1f assertion_failed
	
	# test__inv__5

	la $t0, rm
	la $t1, test__inv__5__input
	lwc1 $f1, 0($t1)
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1)
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1)
	swc1 $f1, 8($t0)
	lwc1 $f1,12($t1)
	swc1 $f1,12($t0)
	lwc1 $f1,16($t1)
	swc1 $f1,16($t0)
	lwc1 $f1,20($t1)
	swc1 $f1,20($t0)
	lwc1 $f1,24($t1)
	swc1 $f1,24($t0)
	lwc1 $f1,28($t1)
	swc1 $f1,28($t0)
	lwc1 $f1,32($t1)
	swc1 $f1,32($t0)
	lwc1 $f1,36($t1)
	swc1 $f1,36($t0)
	lwc1 $f1,40($t1)
	swc1 $f1,40($t0)
	lwc1 $f1,44($t1)
	swc1 $f1,44($t0)
	lwc1 $f1,48($t1)
	swc1 $f1,48($t0)
	lwc1 $f1,52($t1)
	swc1 $f1,52($t0)
	lwc1 $f1,56($t1)
	swc1 $f1,56($t0)
	lwc1 $f1,60($t1)
	swc1 $f1,60($t0)
	lwc1 $f1,64($t1)
	swc1 $f1,64($t0)
	lwc1 $f1,68($t1)
	swc1 $f1,68($t0)
	lwc1 $f1,72($t1)
	swc1 $f1,72($t0)
	lwc1 $f1,76($t1)
	swc1 $f1,76($t0)
	lwc1 $f1,80($t1)
	swc1 $f1,80($t0)
	lwc1 $f1,84($t1)
	swc1 $f1,84($t0)
	lwc1 $f1,88($t1)
	swc1 $f1,88($t0)
	lwc1 $f1,92($t1)
	swc1 $f1,92($t0)
	lwc1 $f1,96($t1)
	swc1 $f1,96($t0)
	jal inv__5
	la $t0, rm_inv
	la $t1, test__inv__5__assertions
	
	lwc1 $f0, 0($t0) # a

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 0($t1) # a assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 4($t0) # b

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 4($t1) # b assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 8($t0) # c

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 8($t1) # c assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 12($t0) # d

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 12($t1) # d assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 16($t0) # e

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 16($t1) # e assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 20($t0) # f

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 20($t1) # f assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 24($t0) # g

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 24($t1) # g assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 28($t0) # h

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 28($t1) # h assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 32($t0) # i

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 32($t1) # i assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 36($t0) # j

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 36($t1) # j assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 40($t0) # k

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 40($t1) # k assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 44($t0) # l

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 44($t1) # l assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 48($t0) # m

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 48($t1) # m assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 52($t0) # n

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 52($t1) # n assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

	lwc1 $f0, 56($t0) # o

	li $v0, 2
	mov.s $f12, $f0		
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	lwc1 $f1, 56($t1) # o assert
	c.eq.s $f0, $f1
	bc1f assertion_failed

exit:
	li $v0, 10
	syscall

assertion_failed:
	break 102

# @param `det` base address of matrix
# @return $f0 determinant
det__2:
	la $t0, det
	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,12($t0)  # d
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1, 4($t0)  # b
	lwc1 $f2, 8($t0)  # c
	mul.s $f4,$f1,$f2 # *
	sub.s $f0,$f3,$f4 # -
	jr $ra

# @param `det` base address of matrix
# @return $f0 determinant
det__3:
	la $t0, det

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,16($t0)  # e
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,32($t0)  # i
	mul.s $f3,$f3,$f1 # *

	mov.s $f0, $f3

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,28($t0)  # h
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,12($t0)  # d
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,32($t0)  # i
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,24($t0)  # g
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,12($t0)  # d
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,28($t0)  # h
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,16($t0)  # e
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,24($t0)  # g
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	jr $ra


# @param `det` base address of matrix
# @return $f0 determinant
det__4:
	la $t0, det

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # k
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # p
	mul.s $f3,$f3,$f1 # *

	mov.s $f0, $f3

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,56($t0)  # o
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,36($t0)  # j
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # p
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,52($t0)  # n
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,36($t0)  # j
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,56($t0)  # o
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # k
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,52($t0)  # n
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,16($t0)  # e
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # k
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # p
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,16($t0)  # e
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,56($t0)  # o
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,32($t0)  # i
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # p
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,48($t0)  # m
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,32($t0)  # i
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,56($t0)  # o
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -
	
	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # k
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,48($t0)  # m
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,16($t0)  # e
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,36($t0)  # j
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # p
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,16($t0)  # e
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,52($t0)  # n
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,32($t0)  # i
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # p
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,48($t0)  # m
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,32($t0)  # i
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,52($t0)  # n
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,36($t0)  # j
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,48($t0)  # m
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,16($t0)  # e
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,36($t0)  # j
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,56($t0)  # o
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,16($t0)  # e
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # k
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,52($t0)  # n
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,32($t0)  # i
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,56($t0)  # o
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # k
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,48($t0)  # m
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,32($t0)  # i
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,52($t0)  # n
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,36($t0)  # j
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,48($t0)  # m
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	jr $ra

# @param `det` base address of matrix
# @return $f0 determinant
det__5:
	la $t0, det

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	mov.s $f0, $f3    # place

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 0($t0)  # a
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 4($t0)  # b
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1, 8($t0)  # c
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,96($t0)  # z
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,76($t0)  # u
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,56($t0)  # p
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,12($t0)  # d
	lwc1 $f2,36($t0)  # k
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,20($t0)  # f
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,24($t0)  # g
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,92($t0)  # y
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -
	
	lwc1 $f1,16($t0)  # e
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,72($t0)  # t
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +	

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,28($t0)  # h
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,52($t0)  # o
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,40($t0)  # l
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,88($t0)  # x
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,44($t0)  # m
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,68($t0)  # s
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,60($t0)  # q
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,84($t0)  # w
	mul.s $f3,$f3,$f1 # *

	sub.s $f0,$f0,$f3 # -

	lwc1 $f1,16($t0)  # e
	lwc1 $f2,32($t0)  # j
	mul.s $f3,$f1,$f2 # *
	lwc1 $f1,48($t0)  # n
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,64($t0)  # r
	mul.s $f3,$f3,$f1 # *
	lwc1 $f1,80($t0)  # v
	mul.s $f3,$f3,$f1 # *

	add.s $f0,$f0,$f3 # +

	jr $ra

# @param `rm` base address of input matrix
# @param `rm_inv` base address of output matrix
# @param `det` see det__2
inv__2:
	addi $sp,$sp,-4
	sw $ra, 0($sp)
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1)
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1)
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1)
	swc1 $f1, 8($t0)
	lwc1 $f1,12($t1)
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f2, $f0
	
	la $t0, rm
	la $t1, rm_inv
	
	# a
	lwc1 $f1, 12($t0) # d
	div.s $f1, $f1, $f2
	swc1 $f1, 0($t1)
	
	# b
	lwc1 $f1, 4($t0) # b
	neg.s $f1, $f1
	div.s $f1, $f1, $f2
	swc1 $f1, 4($t1)
	
	# c
	lwc1 $f1, 8($t0) # c
	neg.s $f1, $f1
	div.s $f1, $f1, $f2
	swc1 $f1, 8($t1)
	
	# d
	lwc1 $f1, 0($t0) # a
	div.s $f1, $f1, $f2
	swc1 $f1, 12($t1)
	
	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra

# @param `rm` base address of input matrix
# @param `rm_inv` base address of output matrix
# @param `det` see det__3
inv__3:
	addi $sp,$sp,-4
	sw $ra, 0($sp)
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1)
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1)
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1)
	swc1 $f1, 8($t0)
	lwc1 $f1,12($t1)
	swc1 $f1,12($t0)
	lwc1 $f1,16($t1)
	swc1 $f1,16($t0)
	lwc1 $f1,20($t1)
	swc1 $f1,20($t0)
	lwc1 $f1,24($t1)
	swc1 $f1,24($t0)
	lwc1 $f1,28($t1)
	swc1 $f1,28($t0)
	lwc1 $f1,32($t1)
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f9, $f0

	# a
	la $t0, det
	la $t1, rm
	lwc1 $f1,16($t1) # e
	swc1 $f1, 0($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1, 4($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 0($t0) # save to a

	# b
	la $t0, det
	la $t1, rm
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 4($t0) # save to b

	# c
	la $t0, det
	la $t1, rm
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1, 8($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 8($t0) # save to c

	# d
	la $t0, det
	la $t1, rm
	lwc1 $f1,12($t1) # d
	swc1 $f1, 0($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1, 4($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 12($t0) # save to d

	# e
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,16($t0) # save to e

	# f
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,20($t0) # save to f

	# g
	la $t0, det
	la $t1, rm
	lwc1 $f1,12($t1) # d
	swc1 $f1, 0($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1, 4($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1, 8($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,24($t0) # save to g

	# h
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1, 8($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,28($t0) # save to h

	# i
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	jal det__2
	# $f0 now has det__2
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,32($t0) # save to i

	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra

# @param `rm` base address of input matrix
# @param `rm_inv` base address of output matrix
# @param `det` see det__4
inv__4:
	addi $sp,$sp,-4
	sw $ra, 0($sp)
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1)
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1)
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1)
	swc1 $f1, 8($t0)
	lwc1 $f1,12($t1)
	swc1 $f1,12($t0)
	lwc1 $f1,16($t1)
	swc1 $f1,16($t0)
	lwc1 $f1,20($t1)
	swc1 $f1,20($t0)
	lwc1 $f1,24($t1)
	swc1 $f1,24($t0)
	lwc1 $f1,28($t1)
	swc1 $f1,28($t0)
	lwc1 $f1,32($t1)
	swc1 $f1,32($t0)
	lwc1 $f1,36($t1)
	swc1 $f1,36($t0)
	lwc1 $f1,40($t1)
	swc1 $f1,40($t0)
	lwc1 $f1,44($t1)
	swc1 $f1,44($t0)
	lwc1 $f1,48($t1)
	swc1 $f1,48($t0)
	lwc1 $f1,52($t1)
	swc1 $f1,52($t0)
	lwc1 $f1,56($t1)
	swc1 $f1,56($t0)
	lwc1 $f1,60($t1)
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f9, $f0

	# a
	la $t0, det
	la $t1, rm
	lwc1 $f1,20($t1) # f
	swc1 $f1, 0($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1, 4($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1, 8($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,12($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,16($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,20($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 0($t0) # save to a

	# b
	la $t0, det
	la $t1, rm
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,12($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,16($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,20($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 4($t0) # save to b

	# c
	la $t0, det
	la $t1, rm
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,12($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 8($t0) # save to c

	# d
	la $t0, det
	la $t1, rm
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,12($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,24($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,28($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,12($t0) # save to d

	# e
	la $t0, det
	la $t1, rm
	lwc1 $f1,16($t1) # e
	swc1 $f1, 0($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1, 4($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,16($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,20($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,16($t0) # save to e

	# f
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,16($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,20($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,20($t0) # save to f

	# g
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,24($t0) # save to g

	# h
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,28($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,28($t0) # save to h

	# i
	la $t0, det
	la $t1, rm
	lwc1 $f1,16($t1) # e
	swc1 $f1, 0($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1, 4($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,16($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,20($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,24($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,32($t0) # save to i

	# j
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,16($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,20($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,24($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,36($t0) # save to j

	# k
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,24($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,40($t0) # save to k

	# l
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,44($t0) # save to l

	# m
	la $t0, det
	la $t1, rm
	lwc1 $f1,16($t1) # e
	swc1 $f1, 0($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1, 4($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,16($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,20($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,24($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,28($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,48($t0) # save to m

	# n
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 8($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,12($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,16($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,20($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,24($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,28($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,52($t0) # save to n

	# o
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,20($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,24($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,28($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,56($t0) # save to o

	# p
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,32($t0)
	jal det__3
	# $f0 now has det__3
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1,60($t0) # save to p

	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra

# @param `rm` base address of input matrix
# @param `rm_inv` base address of output matrix
# @param `det` see det__5
inv__5:
	addi $sp,$sp,-4
	sw $ra, 0($sp)
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1)
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1)
	swc1 $f1, 4($t0)
	lwc1 $f1, 8($t1)
	swc1 $f1, 8($t0)
	lwc1 $f1,12($t1)
	swc1 $f1,12($t0)
	lwc1 $f1,16($t1)
	swc1 $f1,16($t0)
	lwc1 $f1,20($t1)
	swc1 $f1,20($t0)
	lwc1 $f1,24($t1)
	swc1 $f1,24($t0)
	lwc1 $f1,28($t1)
	swc1 $f1,28($t0)
	lwc1 $f1,32($t1)
	swc1 $f1,32($t0)
	lwc1 $f1,36($t1)
	swc1 $f1,36($t0)
	lwc1 $f1,40($t1)
	swc1 $f1,40($t0)
	lwc1 $f1,44($t1)
	swc1 $f1,44($t0)
	lwc1 $f1,48($t1)
	swc1 $f1,48($t0)
	lwc1 $f1,52($t1)
	swc1 $f1,52($t0)
	lwc1 $f1,56($t1)
	swc1 $f1,56($t0)
	lwc1 $f1,60($t1)
	swc1 $f1,60($t0)
	lwc1 $f1,64($t1)
	swc1 $f1,64($t0)
	lwc1 $f1,68($t1)
	swc1 $f1,68($t0)
	lwc1 $f1,72($t1)
	swc1 $f1,72($t0)
	lwc1 $f1,76($t1)
	swc1 $f1,76($t0)
	lwc1 $f1,80($t1)
	swc1 $f1,80($t0)
	lwc1 $f1,84($t1)
	swc1 $f1,84($t0)
	lwc1 $f1,88($t1)
	swc1 $f1,88($t0)
	lwc1 $f1,92($t1)
	swc1 $f1,92($t0)
	lwc1 $f1,96($t1)
	swc1 $f1,96($t0)
	jal det__5
	# $f0 now has det__5
	mov.s $f9, $f0

	# a
	la $t0, det
	la $t1, rm
	lwc1 $f1,24($t1) # g
	swc1 $f1, 0($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1, 4($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1, 8($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,12($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,16($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,20($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,64($t1) # q
	swc1 $f1,32($t0)
	lwc1 $f1,68($t1) # r
	swc1 $f1,36($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,40($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,44($t0)
	lwc1 $f1,84($t1) # v
	swc1 $f1,48($t0)
	lwc1 $f1,88($t1) # w
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 0($t0) # save to a

	# b
	la $t0, det
	la $t1, rm
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,16($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,20($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,64($t1) # q
	swc1 $f1,32($t0)
	lwc1 $f1,68($t1) # r
	swc1 $f1,36($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,40($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,44($t0)
	lwc1 $f1,84($t1) # v
	swc1 $f1,48($t0)
	lwc1 $f1,88($t1) # w
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 4($t0) # save to b

	# c
	la $t0, det
	la $t1, rm
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,64($t1) # q
	swc1 $f1,32($t0)
	lwc1 $f1,68($t1) # r
	swc1 $f1,36($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,40($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,44($t0)
	lwc1 $f1,84($t1) # v
	swc1 $f1,48($t0)
	lwc1 $f1,88($t1) # w
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 8($t0) # save to c

	# d
	la $t0, det
	la $t1, rm
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,32($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,36($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,40($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,44($t0)
	lwc1 $f1,84($t1) # v
	swc1 $f1,48($t0)
	lwc1 $f1,88($t1) # w
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 12($t0) # save to d

	# e
	la $t0, det
	la $t1, rm
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,32($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,36($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,40($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,44($t0)
	lwc1 $f1,64($t1) # q
	swc1 $f1,48($t0)
	lwc1 $f1,68($t1) # r
	swc1 $f1,52($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,56($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 16($t0) # save to e

	# f
	la $t0, det
	la $t1, rm
	lwc1 $f1,20($t1) # f
	swc1 $f1, 0($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1, 4($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1, 8($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,12($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,16($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,20($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	lwc1 $f1,68($t1) # r
	swc1 $f1,36($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,40($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,44($t0)
	lwc1 $f1,80($t1) # u
	swc1 $f1,48($t0)
	lwc1 $f1,88($t1) # w
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 20($t0) # save to f

	# g
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,16($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,20($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	lwc1 $f1,68($t1) # r
	swc1 $f1,36($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,40($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,44($t0)
	lwc1 $f1,80($t1) # u
	swc1 $f1,48($t0)
	lwc1 $f1,88($t1) # w
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 24($t0) # save to g

	# h
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	lwc1 $f1,68($t1) # r
	swc1 $f1,36($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,40($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,44($t0)
	lwc1 $f1,80($t1) # u
	swc1 $f1,48($t0)
	lwc1 $f1,88($t1) # w
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 28($t0) # save to h

	# i
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,32($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,36($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,40($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,44($t0)
	lwc1 $f1,80($t1) # u
	swc1 $f1,48($t0)
	lwc1 $f1,88($t1) # w
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 32($t0) # save to i

	# j
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 8($t1) # c
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,28($t1) # h
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,32($t0)
	lwc1 $f1,48($t1) # m
	swc1 $f1,36($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,40($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,44($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,48($t0)
	lwc1 $f1,68($t1) # r
	swc1 $f1,52($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,56($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 36($t0) # save to j

	# k
	la $t0, det
	la $t1, rm
	lwc1 $f1,20($t1) # f
	swc1 $f1, 0($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1, 4($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1, 8($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,12($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,16($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,20($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	lwc1 $f1,64($t1) # q
	swc1 $f1,36($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,40($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,44($t0)
	lwc1 $f1,80($t1) # u
	swc1 $f1,48($t0)
	lwc1 $f1,84($t1) # v
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 40($t0) # save to k

	# l
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,16($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,20($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,24($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	lwc1 $f1,64($t1) # q
	swc1 $f1,36($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,40($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,44($t0)
	lwc1 $f1,80($t1) # u
	swc1 $f1,48($t0)
	lwc1 $f1,84($t1) # v
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 44($t0) # save to l

	# m
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,32($t0)
	lwc1 $f1,64($t1) # q
	swc1 $f1,36($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,40($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,44($t0)
	lwc1 $f1,80($t1) # u
	swc1 $f1,48($t0)
	lwc1 $f1,84($t1) # v
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 48($t0) # save to m

	# n
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,32($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,36($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,40($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,44($t0)
	lwc1 $f1,80($t1) # u
	swc1 $f1,48($t0)
	lwc1 $f1,84($t1) # v
	swc1 $f1,52($t0)
	lwc1 $f1,92($t1) # x
	swc1 $f1,56($t0)
	lwc1 $f1,96($t1) # y
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	neg.s $f1, $f1
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 52($t0) # save to n

	# o
	la $t0, det
	la $t1, rm
	lwc1 $f1, 0($t1) # a
	swc1 $f1, 0($t0)
	lwc1 $f1, 4($t1) # b
	swc1 $f1, 4($t0)
	lwc1 $f1,12($t1) # d
	swc1 $f1, 8($t0)
	lwc1 $f1,16($t1) # e
	swc1 $f1,12($t0)
	lwc1 $f1,20($t1) # f
	swc1 $f1,16($t0)
	lwc1 $f1,24($t1) # g
	swc1 $f1,20($t0)
	lwc1 $f1,32($t1) # i
	swc1 $f1,24($t0)
	lwc1 $f1,36($t1) # j
	swc1 $f1,28($t0)
	lwc1 $f1,40($t1) # k
	swc1 $f1,32($t0)
	lwc1 $f1,44($t1) # l
	swc1 $f1,36($t0)
	lwc1 $f1,52($t1) # n
	swc1 $f1,40($t0)
	lwc1 $f1,56($t1) # o
	swc1 $f1,44($t0)
	lwc1 $f1,60($t1) # p
	swc1 $f1,48($t0)
	lwc1 $f1,64($t1) # q
	swc1 $f1,52($t0)
	lwc1 $f1,72($t1) # s
	swc1 $f1,56($t0)
	lwc1 $f1,76($t1) # t
	swc1 $f1,60($t0)
	jal det__4
	# $f0 now has det__4
	mov.s $f1, $f0
	div.s $f1, $f1, $f9
	la $t0, rm_inv
	swc1 $f1, 56($t0) # save to o

	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra
