require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :trains

  def self.all
    @all ||= []
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    self.class.all << self
    register_instance
  end

  def validate!
    raise "Название станции не должно быть пустым" if @name == ""
    raise "Название станции должно быть строкой" if !@name.is_a?(String)
  end 

  def valid?
    validate!
    true
  rescue
    false
  end

  def take_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }.size
  end

  def send_train(train)
    @trains.delete(train)
  end

  def to_s
    name
  end

end
