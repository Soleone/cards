require File.dirname(__FILE__) + "/../spec_helper"

include Cards::Creatures
include Cards::Behavior::Abilities

describe "Abilities" do
  before do
    @creature = Creature.new
  end

  context "when included in a Class should add methods:" do    
    it { @creature.should respond_to(:abilities) }
  end
  
  context "AttributeAbilities" do
    it "activate all abilities a creature has with abilities#use" do
      @creature.abilities << AttributeAbility.new(:power, +2)
      @creature.abilities << AttributeAbility.new(:defense, -1)
      @creature.abilities.each { |ab| ab.should_not be_active }

      @creature.abilities.use
      @creature.abilities.each { |ab| ab.should be_active }
    end
  end
end