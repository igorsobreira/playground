'''
The following iterative sequence is defined for the set of positive integers:

n -> n/2 (n is even)
n -> 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13  40  20  10  5  16  8  4  2  1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
Although it has not been proved yet (Collatz Problem), it is thought that all starting 
numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

'''

# Not even close to solve, impossible in brute force... takes too long

def do_action(number):
    if number % 2 == 0:
        return number / 2
    return (3 * number) + 1

def verify_chain(number):
    length = 1
    while number > 1:
        length += 1
        number = do_action(number)
    return length


def main():
    
    number = 999999
    longest = 0
    
    while number > 13:
        length = verify_chain(number)
        print number, length
        if length > longest:
            longest = length
        number -= 1
    
    print longest


if __name__ == '__main__':
    main()