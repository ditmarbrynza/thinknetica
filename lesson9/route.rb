# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations
  attr_accessor :first, :last

  validate :first, :type, Station
  validate :last, :type, Station

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @first = first_station
    @last = last_station
    validate!
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def del_station(station)
    return if [@stations.first, @stations.last].include?(station)

    @stations.delete(station)
  end

  def to_s
    [stations.first, stations.last].join(' - ')
  end

end
