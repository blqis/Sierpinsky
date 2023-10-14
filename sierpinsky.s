.text
.globl main

main:

  #x
  li $t0, 1 
  
  #2**31  
  li $t1, 2147483648 

while_1:

  # si x > 2^31, fin boucle
  bgtu $t0, $t1, done 

  # n = x
  move $t2, $t0 

  # n <= 0, print nl et xor+<< sur x
  blez $t2, newline 
  

while_2:

  # stocke le and de n & 1 dans $t3
  andi $t3, $t2, 1 

  # si parite == 0, else
  beqz $t3, else 
  
  li $v0, 4
  la $a0, hash
  syscall
  
  b ndiv

else:

  li $v0, 4
  la $a0, space
  syscall

ndiv:

  # shift 1 de n, revient a //2
  srl $t2, $t2, 1 

newline:

  # si n > 0, boucle while_2
  bgtz $t2, while_2

  li $v0, 4
  la $a0, nl
  syscall

  # shift sur x
  sll $t4, $t0, 1 

  # xor de x et x_shift
  xor $t0, $t4, $t0 
  
done:
  bleu $t0, $t1, while_1
  jr $ra


.data
nl: .asciiz "\n"
hash: .asciiz "#"
space: .asciiz " "