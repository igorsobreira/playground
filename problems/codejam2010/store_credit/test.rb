require "test/unit"
require "./main.rb"

class StoreCreditTest < Test::Unit::TestCase
  
  def test_small_input
    result = main('A-small-practice.in')
    expected = read_file('A-small-practice.out')

    assert_equal expected, result
  end

  def test_large_input
    result = main('A-large-practice.in')
    expected = read_file('A-large-practice.out')

    assert_equal expected, result
  end

  def read_file(filename)
    File.new(filename).read.strip
  end
end
