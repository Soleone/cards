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
    before do
      @rage = AttributeAbility.new(:power, +2)
      @defense = AttributeAbility.new(:defense, +1)
    end
    
    it "activate all abilities a creature has with abilities#use" do
      @creature.abilities << @rage
      @creature.abilities << @defense
      @creature.abilities.each { |ab| ab.should_not be_active }

      @creature.abilities.use
      @creature.abilities.each { |ab| ab.should be_active }
    end
    
    it "should activate an Effect when using the Ability" do |variable|
      @creature.abilities << @rage
      @creature.effects.should be_empty
      lambda { @creature.abilities.use }.should change{@creature.power}.by(2)
      @creature.should have(1).effects
      @creature.effects.first.should be_active
    end
      
  end
end