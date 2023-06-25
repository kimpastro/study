class MyQueue
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    @items.push item
  end

  def pop
    @items.slice!(0)
  end
end

require "minitest/autorun"

class TestQueue < Minitest::Test
  def setup
    @queue = MyQueue.new

    @queue.add(1)
    @queue.add(2)
    @queue.add(3)
  end

  def test_that_pop_works
    assert_equal 1, @queue.pop
    assert_equal 2, @queue.pop
    assert_equal 3, @queue.pop
    assert_nil @queue.pop
  end
end



