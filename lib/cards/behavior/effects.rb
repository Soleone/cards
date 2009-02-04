module Cards
  module Behavior
    module Effects
      def self.included(base)
        base.send(:include, MetaClass)
          base.class_eval do
            define_method(:effects) do
              @effects ||= EffectArray.new(self)
            end
          end
        end

      # for convenience (de/activate all effects at once)
      class EffectArray < Array
        def initialize(creature)
          @creature = creature
        end
        
        def activate!
          each { |effect| effect.activate!(@creature) }
        end
        
        def deactivate!
          each { |effect| effect.deactivate!(@creature) }
        end
      end
      
      
      class Effect
        attr_reader :attribute, :modifier

        # Example: Effect.new(:power, -2)
        # Decreases the power of the affected creature temporarily by 2
        def initialize(attribute, modifier, temporary=true)
          @attribute, @modifier, @temporary = attribute, modifier, temporary
          @active = false
        end
        
        def temporary?; @temporary; end
        
        def activate!(creature)
          creature.send("#{@attribute}!", @modifier) unless active?
          @active = true
        end
        
        def deactivate!(creature)
          creature.send("#{@attribute}!", -@modifier) if active?
          @active = false
        end
        
        def active?; @active ;end
      end
      
    end
  end
end