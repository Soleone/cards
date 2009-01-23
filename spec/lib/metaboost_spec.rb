require File.dirname(__FILE__) + "/../spec_helper"

class Person
  include MetaBoost
  attributes :first_name, :last_name
end


describe "MetaBoost" do
  before do
    @person = Person.new
  end
  
  context "when included" do
    it "should add a class method called create_attribute to class" do
      lambda do
        class A
          include MetaBoost
          attributes :name
        end
      end.should_not raise_error(NoMethodError)
    end
  end

  context ".attributes <name>" do
    it "should generate a class method called <name>" do
      Person.should respond_to(:first_name)
    end

    it "should generate a getter for <name>" do
      @person.should respond_to(:first_name)
    end
    
    it "should generate a setter for <name>" do
      @person.should respond_to(:first_name=)
    end

    it "getter for <name> should return set value" do
      @person.first_name = "Someone"
      @person.first_name.should == "Someone"
    end
    
    it "getter should return default value" do
      class Person
        first_name "Me"
      end
      Person.new.first_name.should == "Me"
    end
  end
  
  context "generated class method <name>" do
    it "should allow Fixnum as default value for getter <name>" do
      class Person
        attributes :amount
        amount 5
      end
      Person.new.amount.should == 5
    end
  
    it "should allow Array as default value for getter <name>" do
      class Person
        attributes :stuff
        stuff [1,2,3]
      end
      Person.new.stuff.should == [1,2,3]
    end

    it "should allow Hash as default value for getter <name>" do
      class Person
        attributes :stuff
        stuff({:asd => 1})
      end
      Person.new.stuff.should == {:asd => 1}
    end
  end

end