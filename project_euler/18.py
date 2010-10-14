#-*- coding: utf-8 -*-
'''
By starting at the top of the triangle below and moving to adjacent numbers on 
the row below, the maximum total from top to bottom is 23.

3
7 5
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below (in the file 18.in): 

'''

lines = []
with file('18.in_example') as file_obj:
    for line in file_obj.readlines():
        line = line.replace('\n','').split()
        if not line:
            continue
        lines.append( map(int, line) )
        
# só falta fazer... :-)


