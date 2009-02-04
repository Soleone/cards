module Cards
  module Behavior
    module Abilities
      def self.included(base)
        base.send(:include, MetaClass)
        base.class_eval do
          define_method(:abilities) do
            @abilities ||= AbilityArray.new(self)
          end
        end
      end
      
      # for convenience (use all abilities at once)
      class AbilityArray < Array
        def initialize(creature)
          @creature = creature
        end
        
        def use
          each { |ab| ab.use(@creature) }
        end
      end
      
      
      class Ability
        attr_reader :name, :description, :action
        
        def initialize(name, description, action=nil)
          @name, @description, @action = name, description, action
          deactivate!
        end
        
        def use(creature)
          @action.call(creature) unless active?
          activate!
        end
        
        def text
          "#{name} - #{description}"
        end
        
        def activate!
          @active = true
        end
        
        def deactivate!
          @active = false
        end
        
        def active?; @active; end
      end
      
      # An ability that temporarily changes stats by putting effects on the creature
      class AttributeAbility < Ability
        def initialize(attribute, modifier, name=nil, description=nil)
          super(name, description)
          @action = lambda do |creature|
            creature.effects << Cards::Behavior::Effects::Effect.new(attribute, modifier)
            creature.effects.activate!
          end
        end
        
        def text
          string = (modifier >= 0 ? "In" : "De") + "creases #{attribute} by #{modifier.abs}"
        end
      end
    end
  end
end