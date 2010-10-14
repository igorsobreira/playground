#-*- coding: utf-8 -*-
'''
n! means n × (n − 1) × ... × 3 × 2 × 1
Find the sum of the digits in the number 100!
'''

def factorial(n):
    if n == 0:
        return 1
    return n * factorial(n-1)

print sum( [ int(n) for n in str(factorial(100)) ] )
