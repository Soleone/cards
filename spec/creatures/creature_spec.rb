require File.dirname(__FILE__) + "/../spec_helper"

describe "Creature" do
  context "when created" do
    before do
      @creature = Creature.new
    end
    
    it "#type should be 'Creature'" do
      @creature.type.should == "Creature"
    end
  
    it "#text should be nil" do
      @creature.text.should be_nil
    end
  
    it "should have 0 power" do
      @creature.power.should be(0) 
    end

    it "should have 1 defense" do
      @creature.defense.should be(1) 
    end
    
    it "should have 1 health" do
      @creature.health.should be(1)
    end
  end
  
end