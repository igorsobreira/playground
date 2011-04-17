
def main(input_file)
  file = File.new(input_file)
  n = file.readline.to_i
  out = [] 
  (1..n).each do |i|
    credit = file.readline.to_i
    numitems = file.readline.to_i
    prices = file.readline.strip.split.collect!{ |s| s.to_i }
    
    index1,index2 = find_items credit, prices
    out << "Case ##{i}: #{index1} #{index2}"
  end
  file.close
  out.join "\n"
end

def find_items(credit, prices)
  prices.combination(2).each do |couple|
    if couple[0] + couple[1] == credit
      index1 = prices.index(couple[0])
      prices.delete_at index1
      index2 = prices.index(couple[1])
      return [index1+1, index2+2].sort
    end
  end
end

puts main 'A-small-practice.in' if $0 == __FILE__
