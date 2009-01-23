module MetaBoost  
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end

  
private
  module ClassMethods
    def metaclass
      class << self; self; end
    end
    
    def attributes(*names)
      return @_attributes if names.empty?
      
      attr_accessor *names

      names.each do |name|
        metaclass.instance_eval do
          define_method(name) do |value|
            @_attributes ||= {}
            @_attributes[name] = value
          end
        end
      end

      class_eval do
        define_method(:initialize) do
          if self.class.attributes
            self.class.attributes.each do |name, value|
              instance_variable_set "@#{name}", value
            end
          end
        end
      end
      # end attributes
    end
    
  end
  
  module InstanceMethods
  end
  
end