'''
If we list all the natural numbers below 10 that are 
multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

'''

def solve_problem(limit):
    result = 0
    for i in xrange(3, limit):
        if i % 3 == 0 or i % 5 == 0:
            result += i
    return result

if __name__ == '__main__':
    assert 23 == solve_problem(10)
    assert 233168 == solve_problem(1000)
