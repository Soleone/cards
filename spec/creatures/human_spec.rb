require File.dirname(__FILE__) + "/../spec_helper"

describe "Human" do
  it "#type should be 'Human'" do
    Human.new.type.should == "Human"
  end
  
  it "#text should be nil" do
    Human.new.text.should be_nil
  end
  
end