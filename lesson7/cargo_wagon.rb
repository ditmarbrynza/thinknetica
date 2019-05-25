class CargoWagon < Wagon

  NEGATIVE_VALUE = "Объем не может быть отрицательный"
  NOT_INTEGER_VALUE = "Объем не может быть строкой"

  def initialize(number, value)
    @number = number
    @value = value 
    @free_value = value 
    @occupied_value = 0
    @type = "Грузовой"
  end

  def occupy_value(value)
    return if value > @free_value
    @free_value -= value
    @occupied_value += value
  end

  def occupied_value
    @occupied_value
  end

  def free_value
    @free_value
  end

  private 

  def validate!
    raise NOT_INTEGER_VALUE unless @value.is_a?(Integer)
    raise NEGATIVE_VALUE if @value.negative? 
  end

end
