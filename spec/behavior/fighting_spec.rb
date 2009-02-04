require File.dirname(__FILE__) + "/../spec_helper"

include Cards::Creatures

describe "Fighting" do
  before do
    @creature = Creature.new
  end

  context "when included in a Class should add methods:" do    
    it { @creature.should respond_to(:power) }
    it { @creature.should respond_to(:defense) }
    it { @creature.should respond_to(:health) }
    
    it { @creature.should respond_to(:attack) }
    it { @creature.should respond_to(:take_hit) }

    it { @creature.should respond_to(:hit_taken) }
    it { @creature.should respond_to(:killed) }

    it { @creature.should respond_to(:kill!) }
    it { @creature.should respond_to(:killed?) }
    
  end
  
  context "attack" do
    before do
      @target = Creature.new
      @man = Human.create(:power => 2)
      @woman = Human.create(:power => 1, :health => 10)
    end
    
    it "should create a Hit and apply it" do
      lambda { @creature.attack(@target) }.should change { @target.hits.size }.from(0).to(1)
      @target.hits.first.should be_applied
    end
    
    it "should invoke the 'hit_taken' callback" do
      @target.should_receive(:hit_taken)
      @creature.attack(@target)
    end
    
    it "should invoke the generic 'event' callback" do
      @target.should_receive(:event)
      @creature.attack(@target)
    end

    it "should lose 0 health with 1 defense when being hit with 1 power" do
      lambda{ @woman.attack(@man) }.should_not change{@man.health}
    end
    
    it "should lose 1 health with 1 defense when being hit with 2 power" do
      lambda{ @man.attack(@woman) }.should change{@woman.health}.by(-1)
    end

    it "should lose 3 health with 1 defense when hit with 2 power and double-modifier" do
      lambda{ @man.attack(@woman, :double => true) }.should change{@woman.health}.by(-3)
    end
    
    it "should get killed when health reaches 0" do
      @man.attack(@target)
      @target.health.should == 0
      @target.should be_killed
    end
    
    it "should call killed event when killed for first time" do
      @target.should_receive(:killed)
      @target.kill!      
    end
    
    it "should not call killed event when killed and already dead" do
      @target.should_receive(:killed).once
      @target.kill!
      @target.kill!
    end
    
  end
  
end