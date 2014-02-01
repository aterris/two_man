require 'spec_helper'

describe TwoMan::Key do

  before do
    @key = TwoMan::Key.new(23)
  end

  it 'can toggle the key' do
    @key.should_receive(:arm)
    @key.should_receive(:disarm)
    
    @key.toggle(0)
    @key.toggle(1)
  end

  it 'can report if its armed' do
    @key.position = :armed
    @key.armed?.should == true

    @key.position = :off
    @key.armed?.should == false
  end

  it 'can be armed' do
    @key.armed?.should == false
    @key.arm

    @key.armed?.should == true
    @key.time.should be_within(0.1).of(Time.now)
  end

  it 'can be disarmed' do
    @key.arm
    @key.armed?.should == true
    @key.disarm
    
    @key.armed?.should == false
    @key.time.should == nil
  end
end