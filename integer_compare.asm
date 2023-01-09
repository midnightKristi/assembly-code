.data 						# data
buffer: .space 40
prompt: .asciiz "Please enter your name (First Last): "
yname: .asciiz "                                       "
str2: .asciiz "Hello! "
newline: .asciiz "\n"
input1: .asciiz "Please enter the 1st number:"
input2: .asciiz "Please enter the 2nd number:"
eq: .asciiz " equals to "
neq: .asciiz " does not equal to "
dot: .asciiz "."
sum: .asciiz "Their sum equals to "



	.text
	.globl main 				# INSTRUCTIONS

main: 
li $v0, 4 				# print prompt
la $a0, prompt
syscall

li $v0, 8 				# read in string
la $a0, buffer			# load byte space
li $a1, 20 				# length of string = 20	
move $t0, $a0			# save string to reg temp0
syscall

la $a0, str2			# greet the user with "Hello!" string
li $v0, 4
syscall

la $a0, buffer			# load user name
move $a0, $t0
li $v0, 4				# print string
syscall

li $v0, 4					
la $a0, input1			# prompt for 1st int
syscall					

li $v0, 5				# read 1st int -- result in r2
syscall 

move $t1, $v0			# save 1st integer in reg temp1
						
li $v0, 4				
la $a0, input2			# prompt for the 2nd int
syscall

li $v0,5				# read 2nd int -- result in r2
syscall

move $t2, $v0			# save 2nd integer in reg temp2

	#												#
	# compare the two integers and act accordingly	#
	#												#
beq $t1, $t2, else		# if equal, next instruction is at else

li $v0,1				# print 1st int
move $a0,$t1			
syscall					

li $v0, 4				 #print equal message
la $a0, eq
syscall

li $v0,1				# print 2nd int
move $a0,$t2			
syscall	

li $v0, 4				# print the period
la $a0, dot				
syscall 

li $v0, 4				# print a newline
la $a0, newline 
syscall

j summing				# jump to summing

else:					# when the integers do not equal

li $v0,1				# print 1st int
move $a0,$t1			
syscall					

li $v0, 4				 #print not equal message
la $a0, eq
syscall

li $v0,1				# print 2nd int
move $a0,$t2			
syscall	

li $v0, 4				# print the period
la $a0, dot				
syscall 

li $v0, 4				# print a newline
la $a0, newline 
syscall

summing: 

li $v0, 4 				
la $a0, sum				# print summation message
syscall

add $t3, $t1, $t2		# sum both integers and save to reg temp3
			
la $v0, 1				# print the sum integer
move $a0,$t3
syscall

li $v0, 4				# print the period
la $a0, dot				
syscall 

li $v0, 4				# print a newline
la $a0, newline 
syscall

li $v0, 10 					# exit program
syscall
