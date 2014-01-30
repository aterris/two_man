require 'spec_helper'

describe TwoMan::Launcher do

  before do
    PiPiper ||= double.as_null_object
    @launched = TwoMan::Launcher.new()
  end

  it 'can be initialized'

  it 'can check if two armed keys were armed silmutaneously'

  describe "actions" do

    it 'can be set to ready'

    it 'can be armed'

    it 'can be launched'

  end

  describe 'status' do

    it 'can set a valid status'

    it 'rejects an invalid status'

    it 'can indicate if the current status is ready'

    it 'can indicate if the current status is armed'

    it 'can indicate if the current status is launch'
  end

end