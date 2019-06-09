module Accessors

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    WRONG_TYPE = "Тип переменной отличается от указанного"

    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(var_name) }

        define_method("#{name}=".to_sym) do |value|
          if instance_variable_defined?("@#{name}_history")
            old_value = instance_variable_get(var_name)
            instance_variable_get("@#{name}_history") << old_value
          else
            instance_variable_set("@#{name}_history", [])
          end
          instance_variable_set(var_name, value)
        end

        define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_history") }
      end
    end 

    def strong_attr_accessor(name, name_class)
      var_name = "@#{name}".to_sym
      define_method(name){ instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        raise WRONG_TYPE unless value.is_a?(name_class)
        instance_variable_set(var_name, value)
      end

    end

  end

end
