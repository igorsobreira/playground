#!/usr/bin/env python2.7
from __future__ import absolute_import
import unittest

from blist import BList

class BListTest(unittest.TestCase):

    def test_create_list(self):
        l = BList()

        self.assertEqual(0, l.length)
        self.assertEqual(10, l.maxsize)   # 10 is the default

    def test_add_one_element_to_list(self):
        l = BList()
        l.add('a')

        self.assertEqual('a', l.first)
        self.assertEqual(1, l.length)

    # continuar fazendo BList

if __name__ == '__main__':
    unittest.main()
