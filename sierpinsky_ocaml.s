.text
.globl main
main:
  li $t0, 1
  li $t1, 2147483648
while_1:
  bgtu $t0, $t1, done
  move $t2, $t0
  blez $t2, newline
while_2:
  andi $t3, $t2, 1
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
  srl $t2, $t2, 1
newline:
  bgtz $t2, while_2
  li $v0, 4
  la $a0, nl
  syscall
  sll $t4, $t0, 1
  xor $t0, $t4, $t0
done:
  bleu $t0, $t1, while_1
  jr $ra

.data
nl: .asciiz "\n"
hash: .asciiz "#"
space: .asciiz " "
