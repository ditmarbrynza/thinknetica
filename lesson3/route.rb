class Route
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(first_station, last_station)
    @station = []
    @station[0] = first_station
    @station[1] = last_station
  end

# Может добавлять промежуточную станцию в список
  def add_station(transit_station)
    @station.insert(@station.length-1, transit_station)
  end

# Может удалять промежуточную станцию из списка
  def del_station(transit_station)
    @station.delete(transit_station)
  end

# Может выводить список всех станций по-порядку от начальной до конечной
  def show_stations
    @station.each do |station|
      puts station
    end
  end

end