# frozen_string_literal: true

require 'pry'
require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def each
    node = @head
    until node.nil?
      yield(node)
      node = node.next
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def [](index)
    if index == 0
      @head
    else
      node = @head
      index.times do
        node = node.next
        return nil if node.nil?
      end
      node
    end
  end

  def to_s
    @result = 'LinkedList('
    node = @head
    until node.nil?
      @result += node.info
      @result += ', ' unless node.next.nil?
      node = node.next
    end
    @result += ')' if node.nil?
    @result
  end

  def insert(index, value)
    if index == 0
      new_node = Node.new(value, @head)
      @head = new_node
    else
      node = @head
      (index - 1).times do
        node = node.next
      end
      new_node = Node.new(value, node.next)
      node = node.new_next_node(new_node)
    end
  end

  def remove(index)
    if index == 0
      node = @head
      node = node.next_node
      @head = node
    else
      node = @head
      (index - 1).times do
        node = node.next_node
      end
      node_to_remove = node.next_node
      next_after_removed_node = node_to_remove.next_node
      node = node.new_next_node(next_after_removed_node)
    end
  end
end
