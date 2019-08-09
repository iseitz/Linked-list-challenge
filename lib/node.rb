# frozen_string_literal: true

class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    self.data = data
    self.next = next_node
  end

  def info
    data
  end

  def next_node
    self.next
  end

  def new_next_node(node)
    self.next = node
  end
end
