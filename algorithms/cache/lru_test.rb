require 'test/unit'
require './lru.rb'

class LRUCacheTest < Test::Unit::TestCase
  
  def test_just_add_and_get
    c = LRUCache.new 1
    c.add 'k1', 'v1'
    
    assert_equal 'v1', c.get('k1')
  end

  def test_add_new_items
    c = LRUCache.new 3
    c.add 'k1', 'v1'
    c.add 'k2', 'v2'
    c.add 'k3', 'v3'

    assert_equal ['k3','k2','k1'], c.keys
  end

  def test_get_item_makes_it_lru
    c = LRUCache.new 3
    c.add 'k1', 'v1'
    c.add 'k2', 'v2'
    c.add 'k3', 'v3'
    c.get 'k1'

    assert_equal ['k1','k3','k2'], c.keys
  end

  def test_get_non_existent_item_returns_nil_and_doesnt_mess_keys_list
    c = LRUCache.new 3
    c.add 'k1', 'v1'
    c.add 'k2', 'v2'

    assert_equal nil, c.get('foo')
    assert_equal ['k2', 'k1'], c.keys
  end

  def test_adding_more_keys_than_max_limit
    c = LRUCache.new 3
    c.add 'k1', 'v1'
    c.add 'k2', 'v2'
    c.add 'k3', 'v3'
    c.add 'k4', 'v4'
    c.add 'k5', 'v5'

    assert_equal ['k5','k4','k3'], c.keys
  end

  def test_getting_random_items_keeps_lru_sane
    c = LRUCache.new 3
    c.add 'k1', 'v1'
    c.add 'k2', 'v2'
    c.add 'k3', 'v3'
    c.add 'k4', 'v4'
    c.add 'k5', 'v5'
    
    assert_equal 'v4', c.get('k4')
    assert_equal 'v3', c.get('k3')
    assert_equal ['k3','k4','k5'], c.keys
  end

end
