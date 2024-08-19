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
    # new node is created with value used in the append function
    new_node = Node.new(value)
    # if the linked list is empty them this will run
    unless @first_node
      @first_node = new_node
      @last_node = new_node
      return
    end
    # new node's previous link is set to last node
    # and the last_node's next link was set to the new node and
    # new node was set as the last node
    new_node.previous_node = @last_node
    @last_node.next_node = new_node
    @last_node = new_node
  end

  def prepend(value)
    new_node = Node.new(value)

    unless @first_node
      @first_node = new_node
      @last_node = new_node
      return
    end

    new_node.next_node = @first_node
    @first_node.previous_node = new_node
    @first_node = new_node
  end

  def size
    current_index = 0
    current_node = @first_node
    return current_index unless @first_node

    while current_node
      current_node = current_node.next_node
      current_index += 1
    end
    current_index
  end

  def head
    @first_node
  end

  def tail
    @last_node
  end

  def at(index)
    current_index = 0
    current_node = @first_node

    while current_node
      return current_node if current_index == index

      current_node = current_node.next_node
      current_index += 1
    end
  end
end

list = LinkedList.new
list.append("once")
list.append("upon")
p list.at(2)
