class Station
  # Может возвращать список всех поездов на станции, которые находятся на ней в текущий момент

  attr_reader :name, :trains
  # Имеет название, которое указывается при ее создании

  def initialize(name)
    @name = name
    @trains = []
  end

  # Может принимать поезда (по одному за раз)
  def take_train(train)
    @trains << train #объект поезд пишется в массив
    # puts "#{train.number} прибывает на станцию #{self.name}"
  end


  # Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def trains_by_type(type)
    @trains.select { |train| train.type == type }.size
  end

  # Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def send_train(train)
    @trains.delete(train)
    # puts "#{train.number} отправляется со станции #{self.name}"
  end

end
