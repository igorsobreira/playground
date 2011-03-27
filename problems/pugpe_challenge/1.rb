# implementacao em ruby do 1.py

require 'test/unit'

def pack (l)
  groups = [[]]
  l.each do |i|
    index = groups.size - 1
    if groups[index].include? i 
      groups[index].push(i) 
    else
      groups.push [i]
    end
  end
  groups.shift
  groups
end

class ChallengeOne < Test::Unit::TestCase
  def test_pack
    sample = ['a','a','a','a','b','c','c','a','a','d','e','e','e','e']
    expected = [['a','a','a','a'],['b'],['c','c'],['a','a'],['d'],['e','e','e','e']]

    assert_equal expected, pack(sample)
  end
end
