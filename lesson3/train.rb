class Train 
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может возвращать текущую скорость
# Может возвращать количество вагонов

  attr_reader :number, :type, :wagons, :speed

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

# Может набирать скорость
  def gas(speed)
    @speed = speed if speed > @speed && speed >= 1
  end

# Может тормозить (сбрасывать скорость до нуля)
  def stop
    @speed = 0
  end

# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def add_wagons
    @wagons += 1 if @speed == 0
  end

  def del_wagons
    @wagons -= 1 if @speed == 0
  end

# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.

  def take_route(route)
    @train_route = route
    @train_route.station[0].take_train(self)
    @current_station = 0
  end

# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def move_forward
    return if @current_station == @train_route.station.length-1
    @train_route.station[@current_station].send_train(self)
    @current_station += 1
    @train_route.station[@current_station].take_train(self)
  end

  def move_back
    return if @current_station == 0
    @train_route.station[@current_station].send_train(self)
    @current_station -= 1
    @train_route.station[@current_station].take_train(self)
  end

# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def current_station
    puts @train_route.station[@current_station].name
  end

  def next_station
    if @current_station == @train_route.station.length-1
      puts @train_route.station[@current_station-1].name
    else
      puts @train_route.station[@current_station+1].name
    end
  end

  def previous_station
    if @current_station == 0
      puts @train_route.station[@current_station+1].name
    else
      puts @train_route.station[@current_station-1].name
    end
  end

end

tr0 = Train.new("TR0", "passenger", 10)
tr1 = Train.new("TR1", "passenger", 120)
tr2 = Train.new("TR2", "cargo", 100)
