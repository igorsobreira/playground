
def search(num, array):
    low = 0
    high = len(array)-1

    while low < high:
        middle = (low + high) / 2
        
        if num > array[middle]:
            low = middle + 1
        elif num < array[middle]:
            high = middle - 1
        else:
            return middle
    return None
    
if __name__ == '__main__':
    assert 2 == search(20, [5,13,20,40,78,200])
    assert not search(10, [2,4])
        
