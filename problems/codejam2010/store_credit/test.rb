require "test/unit"
require "./main.rb"
require "../gcj_test.rb"

class StoreCreditTest < Test::Unit::TestCase
  
  include GCJTestMethods

  def solve(filename)
    main filename
  end
  
end
