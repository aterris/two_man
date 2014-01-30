require 'rspec'
require 'simplecov'
require 'coveralls'

if ENV['TRAVIS']
  Coveralls::Output.silent = true

  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
    add_filter 'lib/launch_code/'
  end
end

ENV['SPEC'] = 'spec'

require File.expand_path('../../lib/two_man', __FILE__)

RSpec.configure do |config|
  # Output
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation

  config.before(:each) do
    module PiPiper 
      module Pin end
    end

    PiPiper.stub(:watch)

    pin = double
    pin.stub(:off).stub(:on)
    PiPiper::Pin.stub(:new) { pin }
  end
end