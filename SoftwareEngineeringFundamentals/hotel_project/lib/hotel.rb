require_relative "room"

class Hotel
  attr_reader :rooms
  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each { |k, v| @rooms[k] = Room.new(v) }
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  def room_exists?(room_name)
    @rooms.key?(room_name)
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
      if @rooms[room_name].add_occupant(person)
        puts 'check in successful'
      else
        puts 'sorry, room is full'
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    @rooms.values.any? { |v| !v.full? }
  end

  def list_rooms
    @rooms.each { |k, v| puts "#{k} : #{v.available_space}" }
  end
end
