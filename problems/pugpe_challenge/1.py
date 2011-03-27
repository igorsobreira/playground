"""
Desafio PUG-PE  
ID: 1
Semana: 11/02/2011

https://github.com/pugpe/pugpe_challenge/blob/master/desafio_20110211/desafio.py

Problema:

    Dado uma lista de elementos, o objetivo eh converter esta lista em uma lista de sub-listas de elementos consecutivos duplicados.
    Assim que um elemento subsequente for diferente do anterior, a sublista eh gerada e passa para o proximo elemento. Entao 
    no exemplo abaixo dado 5 a's quando encontrar um b ele gera a sublista de 5 a's e comeca a gerar a sublista de b's ate encontrar um
    elemento que nao seja b, e assim sucessivamente. 
    >>> x = ['a','a','a','a','b','c','c','a','a','d','e','e','e','e']
    >>> ret = pack(x)
    >>> ret
    >>> [['a','a','a','a'],['b'],['c','c'],['a','a'],['d'],['e','e','e','e']]
    >>> x = ['a', 'b', 'c']
    >>> ret = pack(x)
    >>> ret 
    >>>[['a'], ['b'], ['c']]
    >>> x = []
    >>> ret = pack(x)
    >>> ret
    >>> []
     
  Seu trabalho eh construir essa lista de elementos.  Favor utilizar Testes usando doctest ou UnitTest para validar sua solucao.

"""

import unittest
from itertools import groupby

def pack(l):
    return [ list(g) for (k,g) in groupby(l) ]

class Desafio1(unittest.TestCase):

    def test_pack_duplicates(self):
        sample = ['a','a','a','a','b','c','c','a','a','d','e','e','e','e']
        expected = [['a','a','a','a'],['b'],['c','c'],['a','a'],['d'],['e','e','e','e']]

        self.assertEquals(expected, pack(sample))

if __name__ == '__main__':
    unittest.main()
