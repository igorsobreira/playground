require 'test/unit'
require "../gcj_test.rb"
require "./main.rb"

class FileFixIt < Test::Unit::TestCase

  include GCJTestMethods
  
  def solve(filename)
    main filename
  end

end
