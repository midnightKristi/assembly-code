
.text
.globl main
main:
la $a0, str
li $v0, 10
syscall # exit
.data
str: .asciiz "Hello World!!!"
