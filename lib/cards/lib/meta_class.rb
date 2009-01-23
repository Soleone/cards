module MetaClass

  def self.included(base)
    base.send(:extend, ClassMethods)
  end
  
  module ClassMethods
    def metaclass
      class << self; self; end
    end
  
    def attributes(*names)
      return @@attributes if names.empty?
    
      attr_accessor *names

      names.each do |name|
        metaclass.instance_eval do
          define_method(name) do |value|
            @@attributes ||= {}
            @@attributes[name] = value
          end
        end
      end

      class_eval do
        define_method(:initialize) do
          #if self.class.attributes
            self.class.attributes.each do |name, value|
             # p "Found attr: #{name} => #{value}"
              instance_variable_set("@#{name}", value) unless instance_variable_get("@#{name}")
            end
          #end
        end
      end
      # end attributes
    end
  end
  
end