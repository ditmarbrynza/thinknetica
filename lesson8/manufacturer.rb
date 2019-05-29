# frozen_string_literal: true

module Manufacturer
  def add_manufacturer(title)
    self.manufacturer = title
  end

  def info_manufacturer
    manufacturer
  end

  protected

  attr_accessor :manufacturer
end
