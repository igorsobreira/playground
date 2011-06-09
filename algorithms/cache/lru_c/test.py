#!/usr/bin/env python2.7
import unittest
from ctypes import cdll, c_char, c_int, POINTER, Structure

lru = cdll.LoadLibrary('./liblru.so')

class node_t(Structure):
    pass
node_t._fields_ = [
        ('data', c_char),
        ('next', POINTER(node_t)),
    ]

class list_t(Structure):
    _fields_ = [
        ('max', c_int),
        ('len', c_int),
        ('head', POINTER(node_t)),
    ]

lru.list_new.argtypes = (c_int,)
lru.list_new.restype = POINTER(list_t)

lru.list_add.argtypes = (POINTER(list_t), c_char)
lru.list_add.restype = POINTER(node_t)

lru.list_bump.argtypes = (POINTER(list_t), c_char)
lru.list_bump.restype = None

lru.list_del.argtypes = (POINTER(list_t), c_char)
lru.list_del.restype = None


class ListTestCase(unittest.TestCase):

    def test_create_empty_list(self):
        mylist = lru.list_new(5)

        self.assertEqual(5, mylist.contents.max)
        self.assertEqual(0, mylist.contents.len)
        self.assertNullPointer(mylist.contents.head)

    def test_add_one_element_to_list(self):
        mylist = lru.list_new(5)
        node = lru.list_add(mylist, 'a')

        self.assertEqual('a', node.contents.data)
        self.assertNullPointer(node.contents.next)
        self.assertEqual(1, mylist.contents.len)
        
        head = mylist.contents.head     # should be `node`

        self.assertNotNullPointer(head)
        self.assertEqual('a', head.contents.data)
        self.assertNullPointer(head.contents.next)
    
    def test_add_four_elements_to_list(self):
        mylist = lru.list_new(4)
        node1 = lru.list_add(mylist, 'a')
        node2 = lru.list_add(mylist, 'b')
        node3 = lru.list_add(mylist, 'c')
        node4 = lru.list_add(mylist, 'd')
        
        self.assertEqual(4, mylist.contents.len)

        head = mylist.contents.head

        self.assertEqual('d', head.contents.data)
        self.assertEqual('c', head.contents.next.contents.data)
        self.assertEqual('b', head.contents.next.contents.next.contents.data)
        self.assertEqual('a', head.contents.next.contents.next.contents.next.contents.data)
        self.assertNullPointer(head.contents.next.contents.next.contents.next.contents.next)

    def test_dummy_list_with_max_size_of_zero_is_always_empty(self):
        mylist = lru.list_new(0)
        lru.list_add(mylist, 'a')
        lru.list_add(mylist, 'a')

        self.assertEqual(0, mylist.contents.len)
        self.assertNullPointer(mylist.contents.head)

    def test_bump_item_moves_it_to_head(self):
        mylist = lru.list_new(4)
        node1 = lru.list_add(mylist, 'a')
        node2 = lru.list_add(mylist, 'b')
        node3 = lru.list_add(mylist, 'c')

        lru.list_bump(mylist, 'b')

        head = mylist.contents.head

        self.assertEqual('b', head.contents.data)
        self.assertEqual('c', head.contents.next.contents.data)
        self.assertEqual('a', head.contents.next.contents.next.contents.data)

    def test_bump_last_item_from_the_list_moves_it_to_head(self):
        mylist = lru.list_new(4)
        node1 = lru.list_add(mylist, 'a')
        node2 = lru.list_add(mylist, 'b')
        node3 = lru.list_add(mylist, 'c')

        lru.list_bump(mylist, 'a')

        head = mylist.contents.head

        self.assertEqual('a', head.contents.data)
        self.assertEqual('c', head.contents.next.contents.data)
        self.assertEqual('b', head.contents.next.contents.next.contents.data)

    def test_remove_item(self):
        mylist = lru.list_new(4)
        node1 = lru.list_add(mylist, 'a')
        node2 = lru.list_add(mylist, 'b')
        node3 = lru.list_add(mylist, 'c')

        lru.list_del(mylist, 'b')

        head = mylist.contents.head

        self.assertEqual('c', head.contents.data)
        self.assertEqual('a', head.contents.next.contents.data)
        self.assertNullPointer(head.contents.next.contents.next)
    
    def test_remove_item_from_tail(self):
        mylist = lru.list_new(4)
        node1 = lru.list_add(mylist, 'a')
        node2 = lru.list_add(mylist, 'b')
        node3 = lru.list_add(mylist, 'c')

        lru.list_del(mylist, 'a')

        head = mylist.contents.head

        self.assertEqual('c', head.contents.data)
        self.assertEqual('b', head.contents.next.contents.data)
        self.assertNullPointer(head.contents.next.contents.next)

    def test_remove_item_from_head(self):
        mylist = lru.list_new(4)
        node1 = lru.list_add(mylist, 'a')
        node2 = lru.list_add(mylist, 'b')
        node3 = lru.list_add(mylist, 'c')
        
        lru.list_del(mylist, 'c')

        head = mylist.contents.head

        self.assertEqual('b', head.contents.data)
        self.assertEqual('a', head.contents.next.contents.data)
        self.assertNullPointer(head.contents.next.contents.next)

    def test_remove_item_from_one_element_list(self):
        mylist = lru.list_new(1)
        lru.list_add(mylist, 'a')
        lru.list_del(mylist, 'a')

        self.assertNullPointer(mylist.contents.head)
    
    def test_list_drops_least_recently_used_if_reach_max_size(self):
        mylist = lru.list_new(3)
        lru.list_add(mylist, 'a')
        lru.list_add(mylist, 'b')
        lru.list_add(mylist, 'c')
        lru.list_add(mylist, 'd')

        self.assertEqual(3, mylist.contents.len)

        head = mylist.contents.head

        self.assertEqual('d', head.contents.data)
        self.assertEqual('c', head.contents.next.contents.data)
        self.assertEqual('b', head.contents.next.contents.next.contents.data)
        self.assertNullPointer(head.contents.next.contents.next.contents.next)

    def test_list_with_max_size_of_one(self):
        mylist = lru.list_new(1)
        lru.list_add(mylist, 'a')
        lru.list_add(mylist, 'b')
         
        self.assertEqual(1, mylist.contents.len)

        head = mylist.contents.head

        self.assertEqual('b', head.contents.data)
        self.assertNullPointer(head.contents.next)


    # helpers

    def assertNullPointer(self, pointer):
        with self.assertRaisesRegexp(ValueError, "NULL pointer access"):
            pointer.contents

    def assertNotNullPointer(self, pointer):
        try:
            self.assertNullPointer(pointer)
        except AssertionError:
            pass
        else:
            self.fail("%s is a NULL pointer" % repr(pointer))


if __name__ == '__main__':
    unittest.main()
