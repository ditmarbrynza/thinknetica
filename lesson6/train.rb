require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter

  EMPTY_NUMBER = "Номер поезда не может быть пустым"
  NUMBER_STRING = "Номер поезда должен быть строкой"
  INVALID_NUMBER = "Номер поезда не соответствует формату"

  attr_reader :number, :wagons, :speed
  attr_writer :route

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  def self.all
    @all ||= {}
  end

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    validate!
    self.class.all[number] = self
    register_instance
  end


  # Релизовать проверку на формат номера поезда. 
  # Допустимый формат: три буквы или цифры в любом порядке, 
  # необязательный дефис (может быть, а может нет) и еще 
  # 2 буквы или цифры после дефиса.
  
  def self.find(number)
    self.all[number]
  end

  def valid?
    validate!
    true 
  rescue 
    false
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

  private 

  def validate!
    raise EMPTY_NUMBER if @number == ""
    raise NUMBER_STRING unless @number.is_a?(String) 
    raise INVALID_NUMBER if @number !~ NUMBER_FORMAT 
  end

end
