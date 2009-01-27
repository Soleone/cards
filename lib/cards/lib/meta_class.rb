module Cards
  module MetaClass

    def self.included(base)
      base.send(:extend, ClassMethods)
    end
 
  private 
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
            
            define_method(:create) do |options|
              instance = new
              options.each do |name, value|
                instance.instance_variable_set("@#{name}", value)
              end
              instance
            end
          end
        end

        class_eval do
          define_method(:initialize) do
            self.class.attributes.each do |name, value|
              instance_variable_set("@#{name}", value)
            end
          end
        end
      end  # end attributes
    end
    
  end
end