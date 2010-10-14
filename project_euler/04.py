
# FIXME: demora muito

# resultado: 104743

from utils import is_prime

num_primes = 0
num = 0
while num_primes <= 10001:
    num += 1
    if is_prime(num):
        num_primes += 1
print num
