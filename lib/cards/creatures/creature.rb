module Cards
  module Creatures
    class Creature < Card
      include Behavior::Fighting
      include Behavior::Effects
      include Behavior::Abilities
    end
  end
end