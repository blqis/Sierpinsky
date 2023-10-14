x = 1
while x < 2147483648: # = 2**31 # affiche triangle
    n = x
    while n > 0: # affiche ligne
        if n & 1: # if impair
            print('#',end='') # end='' empêche l'ajout auto du \n
        else:
            print(' ',end='')
        n >>= 1 # division par 2
    print('')
    x ^= x << 1
