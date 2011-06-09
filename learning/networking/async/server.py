import select

kqueue = select.kqueue()
print kqueue, type(kqueue)
