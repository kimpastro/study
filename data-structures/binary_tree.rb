class Node
  attr_accessor :value, :left, :right

  def initialize(value = nil)
    @value = value
  end
end

class BinaryTree
  attr_reader :root

  def add(value, node = root)
    if root.nil?
      @root = Node.new(value)
      return
    end
    
    if value < node.value
      if node.left.nil?
        node.left = Node.new(value)
      else
        add(value, node.left)
      end
    elsif value > node.value
      if node.right.nil?
        node.right = Node.new(value)
      else
        add(value, node.right)
      end
    end
  end

  def biggest_branch(node = root)
    return 0 if node.nil?
    
    left  = biggest_branch(node.left)
    right = biggest_branch(node.right)
    
    return 1 + [left, right].max
  end
  
  def print_tree(node = root, level = 0)
    return if node.nil?
  
    print_tree(node.left, level + 1)
    puts "  " * level + node.value.to_s
    print_tree(node.right, level + 1)
  end
end

# Running
b_tree = BinaryTree.new

10.times { b_tree.add([*1..100].sample) }

puts "First element: #{b_tree.root.value}"
puts "Biggest branch: #{b_tree.biggest_branch}"

puts "Printing tree:"
b_tree.print_tree
