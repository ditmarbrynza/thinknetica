# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'accessors'
require_relative 'validation'

class Station
  include InstanceCounter
  include Accessors
  include Validation

  attr_reader :name, :trains

  validate :name, :presence
  validate :name, :type, String

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

  def print_trains
    @trains.each { |train| yield(train) }
  end

end
