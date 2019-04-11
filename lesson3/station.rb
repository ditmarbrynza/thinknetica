class Station

	def initialize(name)
		# Имеет название, которое указывается при ее создании 
		@name = name
		@trains_on_station = []
	end

	# Может принимать поезда (по одному за раз)
	def take_train(train)
		@trains_on_station << train
	end

	# Может возвращать список всех поездов на станции, находящиеся в текущий момент
	def trains_on_station
		puts @trains_on_station
	end

	def self
		puts "#{self.class}"
	end

end


# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).