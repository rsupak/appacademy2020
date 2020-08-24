class PolyTreeNode
  attr_reader :children, :value, :parent
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) unless parent.nil?
    @parent = node
    return if node.nil?

    node.children << self unless node.children.include?(self)
  end

  def add_child(node)
    node.parent = self
    @children << node unless @children.include?(node)
  end

  def remove_child(node)
    raise unless @children.include?(node)

    node.parent = nil
    @children.delete(node)
  end

  def dfs(tgt)
    return self if value == tgt

    children.each do |child|
      search_result = child.dfs(tgt)
      return search_result unless search_result.nil?
    end
    nil
  end

  def bfs(tgt)
    queue = [self]

    until queue.empty?
      current = queue.pop
      return current if current.value == tgt

      current.children.each do |child|
        queue.unshift(child)
      end
    end
    nil
  end
end
