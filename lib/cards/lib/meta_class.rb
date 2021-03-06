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
  
      def recursive_attributes
        all_attributes = {}
        ancestors[0..-1].each do |clazz|
          if clazz.respond_to?(:attributes) && clazz.attributes.is_a?(Hash)
            clazz.attributes.each do |key, value|
              all_attributes[key] = value unless all_attributes[key]
            end
          end
        end
        all_attributes
      end
      
      def all_attributes
        @@attributes  
      end
      
      def attributes(*names)
        return @@attributes[self.name] if names.empty?
    
        attr_accessor *names
        
        names.each do |name|
          class_eval do
            # generates e.g.: power!(-2) # changes power by -2
            define_method("#{name}!") do |value|
              old = instance_variable_get("@#{name}")
              instance_variable_set("@#{name}", old + value)
            end
          end
          
          metaclass.instance_eval do
            define_method(name) do |value|
              @@attributes ||= {}
              @@attributes[self.name] ||= {}
              @@attributes[self.name][name] = value
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
            self.class.recursive_attributes.each do |name, value|
              instance_variable_set("@#{name}", value)
            end
          end          
        end
      end  # end attributes
    end
    
  end
end