require File.dirname(__FILE__) + "/../spec_helper"

describe "Creature" do
  it "#type should be 'Creature'" do
    Human.new.type.should == "Creature"
  end
  
  it "#text should be nil" do
    Human.new.text.should be_nil
  end
  
end