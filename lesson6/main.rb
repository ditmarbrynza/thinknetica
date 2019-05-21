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
    @stations = []
    @routes = []
    @trains = []
    main_menu
  end 

  def main_menu
    loop do
      show_main_menu
      key = gets.to_i
      case key
      when 1 then stations_management
      when 2 then trains_management
      when 3 then routes_management
      end
    end
  end

  private 
  #все ниже методы приватные, т.е. могут вызываться только интерфейсом программы, юзер не должен к ним иметь доступ на прямую.
  #private а не protected потому, что они не наследуются и не должны быть видны в подклассах

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
      when 1 then create_station
      when 2 then show_stations
      when 3 then show_station_trains
      when 0 then break
      end 
    end 
  end

  def stations_management_menu
    puts "1 - Создать станцию"
    puts "2 - Просмотреть список станций"
    puts "3 - Просмотреть список поездов на станции"
    puts "0 - Выход"
  end
  
  def create_station
    puts "Введите название станции: "
    name = gets.chomp
    @stations << Station.new(name)
    puts "Создана станция #{name}"
  end

  def show_stations
    puts "Список станций: "
    show_collection(@stations)
  end

  def show_station_trains
    station = select_from_collection(@stations)
    puts "Поезда на станции #{station}:"
    puts station.trains
  end

  def trains_management
    loop do 
      trains_management_menu
      key = gets.to_i
      case key 
      when 1 then create_train(PassengerTrain)
      when 2 then create_train(CargoTrain)
      when 3 then train_management
      when 0 then break
      end
    end
  end 

  def trains_management_menu
    puts "1 - Создать пассажирский поезд"
    puts "2 - Создать грузовой поезд"
    puts "3 - Управлять поездом"
    puts "0 - Назад"
  end

  def create_train(train_type)
    puts "Введите номер поезда:"
    number = gets.chomp
    @trains << train_type.new(number)
  rescue RuntimeError => e 
    puts "#{e}, попробуйте еще раз."
    retry
  ensure
    puts "Создан поезд c номером #{number}"
  end

  def train_management
    loop do
      train_management_menu
      key = gets.to_i
      case key 
      when 1 then add_wagon
      when 2 then del_wagon
      when 3 then move_forward
      when 4 then move_back
      when 0 then break
      end
    end 
  end

  def add_wagon
    train = select_from_collection(@trains)
    train.add_wagon(PassengerWagon.new) if train.attachable_wagon?(PassengerWagon.new)
    train.add_wagon(CargoWagon.new) if train.attachable_wagon?(CargoWagon.new)
  end

  def del_wagon
    train = select_from_collection(@trains)
    wagon = select_from_collection(train.wagons)
    train.del_wagon(wagon)
  end 
    
  def move_forward
    train = select_from_collection(@trains)
    train.move_forward
    puts "Поезд #{train.number} прибывает на станцию #{train.current_station}"
  end

  def move_back
    train = select_from_collection(@trains)
    train.move_back
    puts "Поезд #{train.number} прибывает на станцию #{train.current_station}"
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
      when 1 then create_route
      when 2 then edit_route
      when 3 then show_routes_stations
      when 4 then appoint_route
      when 0 then break
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

  def create_route
    puts "Введите первую станцию:"
    first_station = select_from_collection(@stations)
    puts "Введите вторую станцию:"
    second_station = select_from_collection(@stations)
    if first_station != second_station
      @routes << Route.new(first_station, second_station)
    else 
      puts "Одна и та же станция не может быть началом и концом маршрута"
    end
  end 

  def edit_route
    loop do
      edit_route_menu
      key = gets.to_i
      case key 
      when 1 then add_station
      when 2 then del_station
      when 0 then break
      end
    end 
  end

  def show_routes_stations
    route = select_from_collection(@routes)
    puts "Cписок станций маршрута:"
    show_collection route.stations
  end 

  def appoint_route
    train = select_from_collection(@trains)
    route = select_from_collection(@routes)
    train.route = route
    puts "Поезду #{train} назначен маршрут #{route.to_s}"
  end
  
  def edit_route_menu
    puts "1 - Добавить станцию"
    puts "2 - Удалить станцию"
    puts "0 - Назад"
  end

  def add_station
    route = select_from_collection(@routes)
    station = select_from_collection(@stations)
    route.add_station(station)
  end 

  def del_station
    route = select_from_collection(@routes)
    station = select_from_collection(@stations)
    route.del_station(station)
  end 

  def show_collection(collection)
    collection.each.with_index(1) do |item, index|
      puts "#{index} #{item}"
    end
  end
  
  def select_from_collection(collection)
    show_collection(collection)
    index = gets.to_i - 1
    return if index.negative?
    collection[index]
  end 
  
end

Main.new
