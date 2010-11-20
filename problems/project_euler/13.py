'''
Work out the first ten digits of the sum of the following one-hundred 50-digit 
numbers. (numbers are in 13.in)
'''

with file('13.in') as file_obj:
    s = sum( [ int(n) for n in file_obj.readlines() ] )
    print str(s)[:10]
