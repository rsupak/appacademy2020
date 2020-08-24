require_relative 'tree'

def dfs(root, tgt)
  return nil if root.nil?
  return root if root.val == tgt

  root.children.each do |child|
    search_result = dfs(child, tgt)
    return search_result unless search_result.nil?
  end
  nil
end

# class Tree
#   attr_reader :root
#   def initialize
#     @root = nil
#   end
# end
