# LRU Cache algorithm
# The least recently used keys are removed from cache
# http://en.wikipedia.org/wiki/Cache_algorithms#Least_Recently_Used

class LRUCache

  attr_reader :keys
  
  def initialize(max=5)
    @max = max
    @keys = []
    @hash = {}
  end

  def add(key, value)
    @hash[key] = value
    @keys.insert 0, key
    @keys.delete_at -1 if @keys.size > @max
  end

  def get(key)
    value = @hash[key]
    if value
      @keys.delete key
      @keys.insert 0, key
      value
    end
  end

end
