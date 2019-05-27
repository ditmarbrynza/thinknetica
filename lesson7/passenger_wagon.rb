class PassengerWagon < Wagon

  def initialize(number, volume)
    super(number, volume)
    @type = "Пассажирский"
  end

  def occupy_volume
    super(1)
  end

end
