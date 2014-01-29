require 'rspec'
require 'coveralls'

Coveralls.wear!

require File.expand_path('../../lib/two_man', __FILE__)

RSpec.configure do |config|
  # Output
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
end