# frozen_string_literal: true

require_relative 'manufacturer'

class Wagon
  include Manufacturer

  attr_reader :number, :type, :occupied_volume

  NOT_ENOUGH_SPACE = 'Недостаточно места'
  NOT_INTEGER_VOLUME = 'Значение не может быть строкой'
  NEGATIVE_VOLUME = 'Значение не может быть отрицательным'

  def initialize(number, volume)
    @number = number
    @volume = volume
    @occupied_volume = 0
    validate!
  end

  def occupy_volume(volume)
    raise NOT_ENOUGH_SPACE if volume > free_volume
    raise NOT_ENOUGH_SPACE if free_volume.zero?
    raise NEGATIVE_VOLUME if volume.negative?

    @occupied_volume += volume
  end

  def free_volume
    @volume - @occupied_volume
  end

  def to_s
    number.to_s
  end

  private

  def validate!
    raise NOT_INTEGER_VOLUME unless @volume.is_a?(Integer)
    raise NEGATIVE_VOLUME if @volume.negative?
  end
end
