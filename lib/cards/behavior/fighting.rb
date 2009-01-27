module Cards
  module Behavior
    module Fighting
      def self.included(base)
        base.send(:include, MetaClass)
        base.instance_eval do
          attributes :power, :defense, :health

          power 0
          defense 1
          health 1
        end
      end
      
      # Saves details of a hit from one creature to another
      class Hit
        attr_reader :source, :target
        
        def initialize(source, target, options={})
          @source, @target, @options = source, target, options
        end
        
        def power
          @power ||= @source.power
        end
        
        def double!
          @power = power * 2
        end
        
        def apply
          double! if @options[:double]
          @target.health -= impact
          @applied = true
          self
        end
        
        def applied?
          @applied || false
        end
        
        # damage after defense modifier
        def impact
          power > 0 ? power - @target.defense : 0
        end
      end
      
      # instance methods
      # ================
      
      def attack(creature, options={})
        # TODO: feature - only hit if not blocked, deflected or similar
        creature.take_hit(self, options)
      end
      
      def take_hit(from, options={})
        @hits ||= []
        hit = Hit.new(from, self, options)
        @hits << hit.apply
        event(:hit, hit)        
      end

      def hits
        @hits || []
      end
      
    protected
      # overwrite this in subclasses to react on hits
      def hit_taken(hit)
        puts "#{type} has been hit for #{hit.impact}"
      end
      
    private
      def event(name, *args)
        case name
        when :hit
          hit_taken(args.first)
        end
      end
            
    end
  end
end