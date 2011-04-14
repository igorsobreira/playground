
# takes too long: 1min 30sec

def next(n):
    if n % 2 == 0:
        return n/2
    return 3*n + 1

def sequence_length(n):
    length = 1
    while n != 1:
        length += 1
        n = next(n)
    return length


def main():
    max = 1
    number = 1

    for i in xrange(100, 1000000):
        length = sequence_length(i)
        if length > max:
            max = length
            number = i

    print number
    assert number == 837799

if __name__ == '__main__':
    main()
