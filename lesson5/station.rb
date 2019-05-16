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
    self.class.all << self
    register_instance
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
