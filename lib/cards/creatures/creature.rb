module Cards
  module Creatures
    class Creature < Card
      attributes :attack, :defense

      attack 0
      defense 1
      type name
    end
  end
end