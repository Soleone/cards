module Cards
  module Creatures

    # Base animal
    class Animal < Creature
      title "Animal"
      description "Animals come in all sorts of flavors. They can be tiny and sneaky or big and powerful."
    end
    
    # List actual animals
    class Rhino < Animal
      title "Rhino"
      description "Huge Rhinos can have enormous attacking power and they have a thick armor plating as skin."
      
      power 3
      defense 3
      health 2
    end
    
  end
end