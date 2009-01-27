module Cards
  module Creatures
    class Creature < Card
      include Behavior::Fighting
    end
  end
end