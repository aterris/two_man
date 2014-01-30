require 'spec_helper'

describe TwoMan::Launcher do

  before do
    @launcher = TwoMan::Launcher.new('console')
  end

  it 'can be initialized'

  it 'can check if two armed keys were armed silmutaneously'

  describe "actions" do

    it 'can be set to ready' do
      @launcher.set_status(:armed)
      @launcher.armed?.should == true
      
      @launcher.ready

      @launcher.ready?.should == true
    end

    it 'can be armed' do
      @launcher.ready?.should == true
      @launcher.switch.should_receive(:arm)
      @launcher.keys[:left].should_receive(:disarm)
      @launcher.keys[:right].should_receive(:disarm)

      @launcher.arm

      @launcher.armed?.should == true
    end

    it 'can be launched'

  end

  describe 'status' do

    it 'can set a valid status' do
      @launcher.status.should == :ready
      @launcher.set_status(:armed)
      @launcher.status.should == :armed
    end

    it 'rejects an invalid status' do
      @launcher.status.should == :ready
      @launcher.set_status(:invalid)
      @launcher.status.should == :ready
    end

    it 'can indicate if the current status is ready' do
      @launcher.status.should == :ready
      @launcher.ready?.should == true
    end

    it 'can indicate if the current status is armed' do
      @launcher.status.should == :ready
      @launcher.set_status(:armed)
      @launcher.armed?.should == true
    end

    it 'can indicate if the current status is launch' do
      @launcher.status.should == :ready
      @launcher.set_status(:launch)
      @launcher.launch?.should == true
    end
  end

end