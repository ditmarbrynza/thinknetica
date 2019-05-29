require_relative 'instance_counter'

class Station
  include InstanceCounter

  EMPTY_TITLE = "Название станции не должно быть пустым"
  TITLE_STRING = "Название станции должно быть строкой"

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

  def print_trains(&block)
    @trains.each { |train| yield(train) }
  end

  private

  def validate!
    raise EMPTY_TITLE if @name == ""
    raise TITLE_STRING unless @name.is_a?(String)
  end

end
