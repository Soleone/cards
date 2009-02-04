require File.dirname(__FILE__) + "/../spec_helper"

include Cards::Creatures

describe "Effects" do
  before do
    @creature = Creature.new
  end

  context "when included in a Class should add methods:" do
    it { @creature.should respond_to(:effects) }
  end 
end