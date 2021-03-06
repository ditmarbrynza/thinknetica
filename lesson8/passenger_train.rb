# frozen_string_literal: true

class PassengerTrain < Train
  def attachable_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
  end

  def type
    'Пассажирский'
  end
end
