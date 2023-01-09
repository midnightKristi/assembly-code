.data #data
val1: .asciiz "Enter 1st integer:   " 
val2: .asciiz "Enter 2nd integer:   "
str:  .asciiz "The result =  "

      .text                  	# INSTRUCTIONS
      .globl main

main:   
	li $2, 4		# print string
	la $4, val1
	syscall
	li $2, 5		# read 1st int -- result in r2
	syscall 
	move $16, $2	# save 1st integer
	li $2,4			# print string
	la $4,val2
	syscall
	li $2,5			# read 2nd int -- result in r2
	syscall
	add $16, $16, $2	# sum both integers
	li $2,4			#print string
	la $4, str
	syscall
	li $2,1			# print int
	move $4, $16
	syscall
	li $2,10		# exit program
	syscall