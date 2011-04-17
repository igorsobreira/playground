b = {}
b[1] = "oi"
b[2] = "ola"

print(table.concat(b, "-"))
print(table.maxn(b))

table.remove(b, 1)
table.remove(b, 1)

print(table.maxn(b))
