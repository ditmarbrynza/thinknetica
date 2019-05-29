require_relative 'instance_counter'

class Route
  include InstanceCounter

  INVALID_FIRST_STATION = "1-я станция должна быть объектом типа станция"
  INVALID_LAST_STATION = "Последняя станция должна быть объектом типа станция"

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!
    register_instance
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

  private

  def validate!
    raise INVALID_FIRST_STATION unless @stations.first.is_a?(Station)
    raise INVALID_LAST_STATION unless @stations.last.is_a?(Station)
  end

end
