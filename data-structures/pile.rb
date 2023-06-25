class Pile
  attr_reader :items

  def initialize
    @items = []
  end
  
  def add(item)
    @items.push item
  end

  def pop
    @items.pop
  end
end

require "minitest/autorun"

class TestPile < Minitest::Test
  def setup
    @pile = Pile.new

    @pile.add(1)
    @pile.add(2)
    @pile.add(3)
  end

  def test_that_pop_workds
    assert_equal 3, @pile.pop
  end
end
