class Station

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train #объект поезд пишется в массив
    puts "#{train.number} прибывает на станцию #{self.name}"
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }.size
  end

  def send_train(train)
    @trains.delete(train)
    puts "#{train.number} отправляется со станции #{self.name}"
  end

end
