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
    @speed += speed if speed.positive?
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
    @wagons -= 1 if @speed == 0 && @wagons > 1
  end

# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.

  def route(route)
    @route = route
    @route.stations[0].take_train(self)
    @current_station = 0
  end

# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def move_forward
    return unless next_station
    current_station.send_train(self)
    next_station.take_train(self)
    @current_station += 1
  end

  def move_back
    return unless previous_station
    current_station.send_train(self)
    previous_station.take_train(self)
    @current_station -= 1
  end

# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def current_station
    # puts "текущая станция: #{@route.stations[@current_station].name}"
    @route.stations[@current_station]
  end

  def next_station
    @route.stations[@current_station + 1]
  end

  def previous_station
    @route.stations[@current_station - 1] if @current_station.positive?
  end

end
