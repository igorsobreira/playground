
# FIXME: demora mais de um minuto

num = 1
nums = range(1, 19+1)
def verifica(n):
    for a in nums:
        if n % a != 0:
            return False
    return True

r = False
while r == False:
    num += 1
    r = verifica(num)
    
print num