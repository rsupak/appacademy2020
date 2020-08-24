class Map
  def initialize
    @map = []
  end

  def set(key, value)
    map.each.with_index do |el, i|
      if el[0] == key
        map[i][1] = value
        return map
      end
    end
    map << [key, value]
  end

  def get(key)
    @map.each do |el|
      return el[1] if el[0] == key
    end
  end

  def delete(key)
    map.each do |el|
      map.delete(el) if el[0] == key
    end
    show
  end

  def show
    deep_dup(@map)
  end

  private
  attr_reader :map

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
