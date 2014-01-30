require 'spec_helper'

describe TwoMan::Indicator do

  before do
    @indicator = TwoMan::Indicator.new()
  end

  it 'defines initializes with 3 LEDs' do
    @indicator.pins.length.should == 3
  end

  it 'can turn all LEDs on' do
    @indicator.pins.map do |pin|
      pin.should_receive(:on)
    end

    @indicator.on
  end

  it 'can turn all LEDs off' do
    @indicator.pins.map do |pin|
      pin.should_receive(:off)
    end

    @indicator.off
  end

end