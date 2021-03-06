#!/usr/bin/env python
#
# The sequence of triangle numbers is generated by adding the natural numbers. 
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. 
# The first ten terms would be:
# 
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
# Let us list the factors of the first seven triangle numbers:
# 
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# 
# We can see that 28 is the first triangle number to have over five divisors.
# What is the value of the first triangle number to have over five hundred divisors?
#
'''
>>> main(5)
(28, 6)
>>> main2(5)
(28, 6)

'''

def main(limit):
    triangle_number = 1
    position = 1
    divisors = 1
    while divisors <= limit:
        position += 1
        triangle_number += position
        cont = 1
        divisors = 1
        while cont < triangle_number:
            if triangle_number % cont == 0:
                divisors += 1
            cont += 1
    return triangle_number, divisors

def main2(limit):
    from math import sqrt
    triangle_number = 1
    position = 1
    divisors = 1
    while divisors <= limit:
        position += 1
        triangle_number += position
        cont = 1
        divisors = 1
        sqrt_triangle_number = sqrt(triangle_number)
        while cont < sqrt_triangle_number:
            if triangle_number % cont == 0:
                divisors += 2
            cont += 1
        if triangle_number == int(sqrt_triangle_number * sqrt_triangle_number):
            divisors -= 1
    return triangle_number, divisors


import sys
if len(sys.argv) == 2 and sys.argv[1] ==  'test':
    import doctest
    doctest.testmod()
else:
    import cProfile
    cProfile.run('print main2(5)')
