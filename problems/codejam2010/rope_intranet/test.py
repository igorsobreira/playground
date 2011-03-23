import unittest
from main import main

class ProblemTest(unittest.TestCase):

    def test_small_input(self):
        result = main('A-small-practice.in')
        expected = self._read_file('A-small.out')

        self.assertEquals(result, expected)

    def test_large_input(self):
        result = main('A-large-practice.in')
        expected = self._read_file('A-large.out')

        self.assertEquals(result, expected)

    def _read_file(self, filename):
        with open(filename) as file_obj:
            return file_obj.read().strip()

if __name__ == '__main__':
    unittest.main()
