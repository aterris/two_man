require 'spec_helper'

describe TwoMan::Switch do

  before do
    @key = TwoMan::Switch.new(23)
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
  end

  it 'can be disarmed' do
    @key.arm
    @key.armed?.should == true
    @key.disarm
    @key.armed?.should == false
  end
end