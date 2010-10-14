
num1, num2, sum = 1, 1, 0
print num1

while True:
    aux = num1 + num2
    if aux > 4000000:
        break
    num1 = num2
    num2 = aux
    if aux % 2 != 0:
        continue
    sum += aux

print sum