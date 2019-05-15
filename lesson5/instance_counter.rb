module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    # сеттер на уровне класса
    def instance_counter=(value)
      @instance_counter = value
    end

    # геттер на уровне класса
    def instance_counter
      @instance_counter
    end 

    #возвращает количество экземпляров класса
    def instances
      @instance_counter
    end
  end 

  module InstanceMethods

    protected

    def register_instance
      self.class.instance_counter ||= 0 #сеттер
      self.class.instance_counter += 1
    end 

  end

end