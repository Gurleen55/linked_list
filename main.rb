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

  def pop
    return if @last_node.nil?

    if @first_node == @last_node
      # if there is only one node
      @first_node = nil
      @last_node = nil
    else
      # set the last node to previous node
      @last_node = @last_node.previous_node
      @last_node.next_node = nil # remove reference to the removed node
    end
  end

  def contains?(value)
    current_node = @first_node
    while current_node
      return true if current_node.data == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_index = 0
    current_node = @first_node

    while current_node
      return current_index if current_node.data == value

      current_index += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    current_node = @first_node
    string = ""
    while current_node
      string += "( #{current_node.data} ) -> "
      current_node = current_node.next_node
    end
    "#{string}nil"
  end

  def insert_at(value, index)
    new_node = Node.new(value)

    if index == 0
      new_node.next_node = first_node
      first_node.previous_node = new_node if first_node
      self.first_node = new_node
    else
      current_index = 0
      current_node = first_node

      while current_index < index - 1 && current_node.next_node
        current_node = current_node.next_node
        current_index += 1
      end

      new_node.next_node = current_node.next_node
      new_node.previous_node = current_node
    end

    current_node.next_node.previous_node = new_node if current_node.next_node

    current_node.next_node = new_node
  end

  def remove_at(index)
    if index == 0 && first_node
      @first_node = first_node.next_node
      @first_node.previous_node = nil if first_node
    else
      current_index = 0
      current_node = first_node

      while current_index < index - 1 && current_node.next_node
        current_index += 1
        current_node = current_node.next_node
      end

      if current_node.next_node
        node_to_remove = current_node.next_node
        current_node.next_node = node_to_remove.next_node
        node_to_remove.next_node.previous_node = current_node if node_to_remove.next_node
      end
    end
  end
end

list = LinkedList.new
list.append("once")
list.append("upon")
list.append("a")
list.append("time")

list.remove_at(2)
puts list
