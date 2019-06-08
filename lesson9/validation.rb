module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(name, type, *params)
      @validations ||= []
      @validations << {name: name, type: type, params: params}
    end

    def validations
      @validations
    end

  end

  module InstanceMethods
    
    def validate!
      self.class.validations.each do |validation|
        send("validate_#{validation[:type]}", validation[:name], validation[:params])
      end
    end 

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    private 
    
    def validate_presence(name, params)
      variable = instance_variable_get("@#{name}")
      raise "Значение атрибута является пустой строкой" if variable == "" || variable.nil? 
    end 

    def validate_format(name, params)
      raise "Значение атрибута не соответствует формату #{params[0]}" if instance_variable_get("@#{name}") !~ params[0]
    end 

    def validate_type(name, params)
      raise "Значение атрибута не соответствует классу #{params[0]}" unless instance_variable_get("@#{name}").is_a?(params[0])
    end

  end
end