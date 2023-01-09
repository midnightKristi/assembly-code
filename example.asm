.text
.globl main
main:
la $a0,prompt #Load and print string asking for string
li $v0,4
syscall

li $v0,8		#take in input
la $a0, buffer	#load byte space into address
li $a1, 20		# allot the byte space for string
move $t0,$a0	#save string to t0
syscall

la $a0,str2		 #load and print "Hello!" string
li $v0,4
syscall

la $a0, buffer	#reload byte space to primary address
move $a0,$t0	# primary address = t0 address (load pointer)
li $v0,4		# print string
syscall

li $v0, 4       # system call code for printing string = 4
la $a0, input1       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation
  
li $v0,5           # system call code for reading integer(inputting a integer)
syscall           # call operating system to perform read operation
move $t1,$v0       # move the read integer to t1 register


li $v0, 4       # system call code for printing string = 4
la $a0, input2       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation
  
li $v0,5           # system call code for reading integer(inputting a integer)
syscall           # call operating system to perform read operation
move $t2,$v0       # move the read integer to t1 register

seq $t3,$t1,$t2

if:
beqz $t3,else

li $v0,1           # system call code for printing int = 1
move $a0,$t1       # load address of int to be printed into $a0(result is printed)
syscall           # call operating system to perform print operation

li $v0, 4       # system call code for printing string = 4
la $a0, eq       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation

li $v0,1           # system call code for printing int = 1
move $a0,$t2       # load address of int to be printed into $a0(result is printed)
syscall           # call operating system to perform print operation

li $v0, 4       # system call code for printing string = 4
la $a0, dot       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation

b if_end
else:

li $v0,1           # system call code for printing int = 1
move $a0,$t1       # load address of int to be printed into $a0(result is printed)
syscall           # call operating system to perform print operation

li $v0, 4       # system call code for printing string = 4
la $a0, neq       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation

li $v0,1           # system call code for printing int = 1
move $a0,$t2       # load address of int to be printed into $a0(result is printed)
syscall           # call operating system to perform print operation

li $v0, 4       # system call code for printing string = 4
la $a0, dot       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation

if_end:

li $v0, 4       # system call code for printing string = 4
la $a0, newline       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation

add $t3,$t1,$t2

li $v0, 4       # system call code for printing string = 4
la $a0, sum       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation

li $v0,1           # system call code for printing int = 1
move $a0,$t3       # load address of int to be printed into $a0(result is printed)
syscall           # call operating system to perform print operation

li $v0, 4       # system call code for printing string = 4
la $a0, dot       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation

li $v0, 4       # system call code for printing string = 4
la $a0, newline       # load address of string to be printed into $a0
syscall           # call operating system to perform print operation
  
li $v0,10 #end program
syscall


.data
buffer: .space 40
prompt: .asciiz "Please Enter Your Name: "
str2: .asciiz "Hello! "
newline: .asciiz "\n"
input1: .asciiz "Please enter the 1st number:"
input2: .asciiz "Please enter the 2nd number:"
eq: .asciiz " equals to "
neq: .asciiz " does not equal to "
dot: .asciiz "."
sum: .asciiz "Their sum equals to "