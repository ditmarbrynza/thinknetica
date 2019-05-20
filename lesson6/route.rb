require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(first_station, last_station)
    validate!(first_station, last_station)
    @stations = [first_station, last_station]
    register_instance
  end

  def validate!(first_station, last_station)
    raise "1-я станция должна быть объектом типа станция" if !first_station.is_a?(Station)
    raise "Последняя станция должна быть объектом типа станция" if !last_station.is_a?(Station)
  end

  def valid?
    validate!
    true
  rescue
    false
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
