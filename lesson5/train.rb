require_relative 'manufacturer'

class Train 
  include Manufacturer
  
  attr_reader :number, :wagons, :speed
  attr_writer :route

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
  end

  def gas(speed)
    @speed += speed if speed.positive?
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    return unless @speed.zero?
    return unless attachable_wagon?(wagon)
    @wagons << wagon    
  end

  def del_wagon(wagon)
    return unless @speed.zero?
    @wagons.delete(wagon)
  end

  def route=(route)
    @route = route
    @route.stations[0].take_train(self)
    @current_station = 0
  end

  def move_forward
    return unless next_station
    current_station.send_train(self)
    next_station.take_train(self)
    @current_station += 1
  end

  def move_back
    return unless previous_station
    current_station.send_train(self)
    previous_station.take_train(self)
    @current_station -= 1
  end

  def current_station
    @route.stations[@current_station]
  end

  def next_station
    @route.stations[@current_station + 1]
  end

  def previous_station
    @route.stations[@current_station - 1] if @current_station.positive?
  end

  def to_s
    number
  end

end
