require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter

  attr_reader :number, :wagons, :speed
  attr_writer :route

  NUMBER_FORMAT = /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/

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

  def validate!
    raise "Номер поезда не может быть пустым" if @number == ""
    raise "Номер поезда должен быть строкой" if !@number.is_a?(String) 
    raise "Номер поезда не соответствует формату" if @number !~ NUMBER_FORMAT 
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

end
