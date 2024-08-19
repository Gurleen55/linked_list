require "rubocop"

# class to implements nodes
class Node
  attr_accessor :data, :next_node, :previous_node

  def initialize(data)
    @data = data
  end
end

# implementing linked list for the nodes
class LinkedList
  attr_accessor :first_node, :last_node

  def initialize(first_node = nil, last_node = nil)
    @first_node = first_node
    @last_node = last_node
  end

  def append(value)
    new_node = Node.new(value)
    unless @first_node
      @first_node = new_node
      @last_node = new_node
    end
    new_node.previous_node = @last_node
    @last_node.next_node = new_node
    @last_node = new_node
  end
end

linked_list = LinkedList.new
linked_list.append("hello world")
p linked_list
