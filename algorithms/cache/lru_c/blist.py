#!/usr/bin/env python2.7
# 
# Bind to blist.c, a list with boundaries
#

from ctypes import cdll, c_char, c_int, POINTER, Structure

blist = cdll.LoadLibrary('./libblist.so')

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

list_new = blist.list_new
list_new.argtypes = (c_int,)
list_new.restype = POINTER(list_t)

list_add = blist.list_add
list_add.argtypes = (POINTER(list_t), c_char)
list_add.restype = POINTER(node_t)

list_bump = blist.list_bump
list_bump.argtypes = (POINTER(list_t), c_char)
list_bump.restype = None

list_del = blist.list_del
list_del.argtypes = (POINTER(list_t), c_char)
list_del.restype = None

class BList(object):
    
    def __init__(self, maxsize=10):
        self._list = list_new(maxsize)

    @property
    def first(self):
        try:
            return self._list.contents.head.contents.data
        except ValueError:
            return None

    @property
    def length(self):
        return self._list.contents.len

    @property
    def maxsize(self):
        return self._list.contents.max

    def add(self, item):
        list_add(self._list, item)

    def bump(self, item):
        pass

    def delete(self, item):
        pass

