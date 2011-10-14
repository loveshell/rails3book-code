require 'spec_helper'

describe Event do
  
  before do
    @event = Event.new( :name => "foobar" )
  end
  
  describe ".closed?" do
    it "should return true if status is CLOSED" do
      @event.status = "CLOSED"
      @event.closed?.should be_true
    end
    
    it "should return false if status is not CLOSED" do
      @event.status = "OPEN"
      @event.closed?.should be_false
    end
  end
  
  describe ".open?" do
    it "should return true if status is OPEN" do
      @event.status = "OPEN"
      @event.open?.should be_true
    end
    
    it "should return false if status is not OPEN" do
      @event.status = "CLOSED"
      @event.open?.should be_false
    end
  end
  
  describe "open!" do
    it "should set status to OPEN" do
      @event.open!
      @event.status.should == "OPEN"
    end
  end
  
  describe "close!" do
    it "should set status to CLOSED" do
      @event.close!
      @event.status.should == "CLOSED"
    end
  end
  
end