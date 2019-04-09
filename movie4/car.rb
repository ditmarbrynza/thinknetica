class Car
  attr_accessor :color
  attr_reader :number, :door_title

  def initialize(number)
    @number = number
    @color = 'white'
  end

  def beep
    puts 'beep beep'
  end

  def change_door_title(driver)
    @door_title = driver.name if driver.cars.include?(self)
  end
end 