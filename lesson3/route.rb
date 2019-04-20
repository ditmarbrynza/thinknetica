class Route

  attr_reader :stations

# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

# Может добавлять промежуточную станцию в список
  def add_station(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

# Может удалять промежуточную станцию из списка
  def del_station(station)
    return if [@stations.first, @stations.last].include?(station)
    @stations.delete(station)
  end

# Может выводить список всех станций по-порядку от начальной до конечной
  def show_stations
    @stations.each do | station |
      puts station.name
    end
  end

end
