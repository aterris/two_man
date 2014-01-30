require 'rspec'
require 'coveralls'

if ENV['TRAVIS']
  Coveralls::Output.silent = true
  Coveralls.wear!
end

require File.expand_path('../../lib/two_man', __FILE__)

RSpec.configure do |config|
  # Output
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
end