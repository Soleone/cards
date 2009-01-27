require File.dirname(__FILE__) + "/../spec_helper"

include Cards::Creatures

describe "Human" do
  it "#type should be 'Human'" do
    Human.new.type.should == "Human"
  end
  
  it "#text should be nil" do
    Human.new.text.should be_nil
  end
  
  context "when created" do
    it "should have 0 power" do
      Human.new.power.should be(0) 
    end

    it "should have 1 defense" do
      Human.new.defense.should be(1) 
    end
    
    it "should have 2 health" do
      Human.new.health.should be(2)
    end    
  end
end