class PassengerWagon < Wagon

  NOT_INTEGER_PLACES = "Количество мест не может быть строкой"
  NEGATIVE_PLACES = "Количество мест не может быть отрицательным"

  def initialize(number, places)
    @number = number
    @places = places 
    @free_places = places
    @occupied_places = 0
    @type = "Пассажирский"
    validate!
  end

  def occupy_places
    return if @occupied_places == @places
    @occupied_places +=1
    @free_places -= 1
  end

  def occupied_places
    @occupied_places
  end

  def free_places
    @free_places
  end

  private

  def validate!
    raise NOT_INTEGER_PLACES unless @places.is_a?(Integer)
    raise NEGATIVE_PLACES if @places.negative? 
  end

end
