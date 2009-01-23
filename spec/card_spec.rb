require File.dirname(__FILE__) + "/spec_helper"

describe "Card" do
  before do
    @card = Card.new
  end
  
  it do
    Card.ancestors.should include(MetaBoost)
  end
  
  context ".attr_generate" do
    it "should respond to .title" do
      Card.should respond_to(:title)
    end
    
    it do
      @card.should respond_to(:title)
    end
  end
  
  it "should have a attr_generated title, text and description" do
    @card.should respond_to(:title)
    @card.should respond_to(:text)
    @card.should respond_to(:description)
    Card.should respond_to(:title)
    Card.should respond_to(:text)
    Card.should respond_to(:description)
  end
  
  it "should have type of 'Card'" do
    @card.type.should == "Card"
  end
end