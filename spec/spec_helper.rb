require 'rspec'
require 'coveralls'

if ENV['TRAVIS']
  Coveralls::Output.silent = true
  Coveralls.wear!
end

ENV['SPEC'] = 'spec'

require File.expand_path('../../lib/two_man', __FILE__)

RSpec.configure do |config|
  # Output
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation

  config.before(:each) do
    module PiPiper end

    PiPiper.stub(:watch)

    pin = double
    pin.stub(:off).stub(:on)
    PiPiper::Pin ||= double
    PiPiper::Pin.stub(:new) { pin }
  end
end