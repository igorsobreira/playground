
module GCJTestMethods 
  
  def test_small_input
    result = solve("A-small-practice.in")
    expected = read_file("A-small-practice.out")

    assert_equal expected, result
  end

  def test_large_input
    result = solve('A-large-practice.in')
    expected = read_file('A-large-practice.out')

    assert_equal expected, result
  end

  def read_file(filename)
    File.new(filename).read.strip
  end
  
end
