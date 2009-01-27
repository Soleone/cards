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
      
      # try to git another creature
      # TODO: could later be used to only hit if not blocked, deflected or similar.
      #       Creatures could also have different chances to hit in an additional attribute (more complex rules though)
      def attack(creature, options={})
        creature.take_hit(self, options)
      end
      
      # the creature gets hit
      def take_hit(from, options={})
        @hits ||= []
        hit = Hit.new(from, self, options)
        @hits << hit.apply
        event(:hit, hit)        
      end
      
      # all the hits this creature has endured
      # TODO: could later be used for bonuses or special abilities for example
      def hits
        @hits || []
      end
      
      def killed?
        kill! if health <= 0
        @killed 
      end
      
      def kill!
        return if @killed
        health = 0
        event(:killed)
        @killed = true
      end
      
    protected
      # overwrite this in subclasses to react on incoming hits
      def hit_taken(hit)
        puts "#{type} has been hit for #{hit.impact}"
      end

      # overwrite this in subclasses to react when the creature dies
      def killed
        puts "#{type} has been killed"
      end
      
    private
      def event(name, *args)
        case name
        when :hit
          self.hit_taken(args.first)
          self.killed?
        when :killed
          self.killed
        end
      end
            
    end
  end
end