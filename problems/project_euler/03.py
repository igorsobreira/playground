'''
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

'''

def solve_problem(limit):
    i = limit
    while i > 0:
        if is_prime(i):
            print i
        i -= 1

def is_prime(num):
    for n in range(2, num):
        if num % n == 0:
            return False
    return True

if __name__ == '__main__':
    print is_prime(4)
    print is_prime(7)
    #solve_problem(13195)
