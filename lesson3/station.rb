class Station
  attr_reader :name
  # Имеет название, которое указывается при ее создании
  def initialize(name)
    @name = name
    @trains_on_station = []
  end

  # Может принимать поезда (по одному за раз)
  def take_train(train)
    @trains_on_station << train #объект поезд пишется в массив
  end

  # Может возвращать список всех поездов на станции, которые находятся на ней в текущий момент
  def trains_at_station
    puts "Список всех поездов, находящихся на станции в текущий момент"
    @trains_on_station.each do | train |
      puts "#{train.number}"
    end
  end

  # Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def trains_at_station_by_type(type)

    return if ( type != "cargo" ) && ( type != "passenger" )

    quantity = 0
    train_buf = []
    puts "Список и количество поездов типа #{type}:"
    @trains_on_station.each do | train |
      if train.type == type
        train_buf << train.number
        quantity += 1
      end
    end

    puts quantity

    train_buf.each do | train |
      puts train
    end

  end

  # Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def send_train(train)
    @trains_on_station.delete(train)
  end

end

st0 = Station.new("st0")
