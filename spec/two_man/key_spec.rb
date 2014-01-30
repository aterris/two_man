require 'spec_helper'

describe TwoMan::Key do

  before do
    #PiPiper ||= double.as_null_object
    #stub_const("PiPiper", 10)
    @key = TwoMan::Key.new(23)
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