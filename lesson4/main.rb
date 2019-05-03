require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'station'
require_relative 'route'

class Main

  def initialize
    @stations = {}
    @routes = {}
    @trains = {}
    main_menu
  end 

  def main_menu
    loop do
      show_main_menu
      key = gets.to_i
      case key
      when 1
        stations_management
      when 2
        trains_management
      when 3 
        routes_management
      end

    end
    
  end

  def show_main_menu
    puts "1 - Управление станциями"
    puts "2 - Управление поездами"
    puts "3 - Управление маршрутами"
  end

  def stations_management
    loop do
      stations_management_menu
      key = gets.to_i
      case key 
      when 1
        puts "Введите название станции: "
        name = gets.chomp
        @stations[name] = Station.new(name)
        puts "Создана станция #{@stations[name].name}"
      when 2
        puts "Список всевозможных станций: "
        @stations.each { |station_name, object| puts station_name}
      when 3
        station = get_station
        if station 
          @stations[station].trains.each {|train| puts "#{train.number}"}
        end
      when 0
        break 
      end 
    end 
  end

  def stations_management_menu
    puts "1 - Создать станцию"
    puts "2 - Просмотреть список станций"
    puts "3 - Просмотреть список поездов на станции"
    puts "0 - Выход"
  end

  def trains_management
    loop do 
      trains_management_menu
      key = gets.to_i
      case key 
      when 1
        puts "Введите номер поезда: "
        number = gets.chomp
        @trains[number] = PassengerTrain.new(number)
      when 2
        puts "Введите номер поезда: "
        number = gets.chomp
        @trains[number] = CargoTrain.new(number)
      when 3
        train_management
      when 0
        break
      end
    end
  end 

  def trains_management_menu
    puts "1 - Создать пассажирский поезд"
    puts "2 - Создать грузовой поезд"
    puts "3 - Управлять поездом"
    puts "0 - Назад"
  end

  def train_management
    loop do
      train_management_menu
      key = gets.to_i
      case key 
      when 1
        train = get_train
        @trains[train].add_wagon(CargoWagon.new) if @trains[train].attachable_wagon?(CargoWagon.new)
        @trains[train].add_wagon(PassengerWagon.new) if @trains[train].attachable_wagon?(PassengerWagon.new) 
      when 2
        train = get_train
        if train
          puts "Список вагонов: #{@trains[train].show_wagons}" 
          wagon = gets.chomp 
          @trains[train].add_wagon(wagon)
        end
      when 3
        train = get_train
        @trains[train].move_forward if train
      when 4
        train = get_train
        @trains[train].move_back if train
      when 0
        break 
      end
    end 
  end

  def train_management_menu
    puts "1 - Добавить вагон к поезду"
    puts "2 - Отцепить вагон от поезда"
    puts "3 - Перемещать поезд по маршруту вперед"
    puts "4 - Перемещать поезд по маршруту назад"
    puts "0 - Назад"
  end

  def routes_management
    loop do 
      routes_management_menu

      key = gets.to_i 
      case key
      when 1
        puts "Введите первую станцию маршрута: "
        first_station = gets.chomp
        puts "Введите последнюю станцию маршрута: "
        last_station = gets.chomp 
        if @stations.has_key?(first_station) && @stations.has_key?(last_station)
          route = first_station + " - " + last_station
          @routes[route] = Route.new(@stations[first_station], @stations[last_station])
          puts "Создан маршрут #{route}"
        else 
          puts "Введена неверная станция"
        end
      when 2
        route = get_route
        route_edit(route) if route 
      when 3
        route = get_route
        if route
          puts "Станции маршрута #{route} следующие: "
          @routes[route].show_stations
        end
      when 4
        route = get_route
        if route 
          train = get_train
          @trains[train].route(@routes[route]) if train 
        end
      when 0
        break 
      end
    end 
  end 

  def routes_management_menu
    puts "1 - Создать маршрут"
    puts "2 - Редактировать маршрут"
    puts "3 - Просмотреть список станций маршрута"
    puts "4 - Назначить маршрут поезду"
    puts "0 - Назад"
  end

  def route_edit(route)
    loop do
      route_edit_menu
      key = gets.to_i
      case key 
      when 1
        puts "Введите название станции:"
        name = gets.chomp
        if @stations.has_key?(name)
          @routes[route].add_station(@stations[name])
          puts "Станция #{name} добавлена к маршруту #{route}"
        else
          puts "Введена неверная станция"
        end
      when 2
        puts "Введите название станции:"
        name = gets.chomp
        if @stations.has_key?(name)
          @routes[route].del_station(@stations[name])
          puts "Станция #{name} удалена из маршрута #{route}"
        else
          puts "Введена неверная станция"
        end
      when 0
        break 
      end
    end 
  end

  def route_edit_menu
    puts "1 - Добавить станцию"
    puts "2 - Удалить станцию"
    puts "0 - Назад"
  end

  def get_train
    puts "Доступные поезда: "
    @trains.each {|key, value| puts key}
    puts "Введите номер поезд: "
    train = gets.chomp
    if @trains.has_key?(train)
      return train 
    else 
      puts "Введен неверный номер поезда" 
    end
  end 

  def get_route
    puts "Доступные маршруты: "
    @routes.each {|key, value| puts key}
    puts "Введите маршрут: "
    route = gets.chomp
    if @routes.has_key?(route)
      return route
    else 
      puts "Введен неверный маршрут"
    end
  end

  def get_station
    puts "Доступные станции: "
    @stations.each {|key, value| puts key}
    puts "Введите станцию: "
    station = gets.chomp
    if @stations.has_key?(station)
      return station
    else 
      puts "Введена неверная станция"
    end
  end

end

x = Main.new

# wc1 = CargoWagon.new
# wc2 = CargoWagon.new
# wc3 = CargoWagon.new

# wp1 = PassengerWagon.new
# wp2 = PassengerWagon.new
# wp3 = PassengerWagon.new

# train_p1 = PassengerTrain.new("001")
# train_p2 = PassengerTrain.new("002")
# train_p3 = PassengerTrain.new("003")

# train_c1 = CargoTrain.new("001")
# train_c2 = CargoTrain.new("002")
# train_c3 = CargoTrain.new("003")

# station1 = Station.new("St1")
# station2 = Station.new("St2")
# station3 = Station.new("St3")
# station4 = Station.new("St4")
# station5 = Station.new("St5")

# route1 = Route.new(station1, station2)
# puts route1.show_stations

# train_p1.add_wagon(wc1)
# train_p1.add_wagon(wp1)
# puts train_p1.show_wagons

# - Создавать станции +
# - Создавать поезда +
# - Создавать маршруты и управлять станциями в нем (добавлять, удалять) +

# - Назначать маршрут поезду +
# - Добавлять вагоны к поезду
# - Отцеплять вагоны от поезда
# - Перемещать поезд по маршруту вперед и назад

# - Просматривать список станций +
# - Просматривать список поездов на станции +