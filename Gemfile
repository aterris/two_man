source 'https://rubygems.org'

gem 'thor'
gem 'rainbow'
gem 'sinatra'

gem 'activesupport'
gem 'git'
gem 'pi_piper'

gem 'rspec'
gem 'coveralls'

Dir[File.expand_path('../lib/launch_code/**/Gemfile', __FILE__)].each do |gemfile|
  eval File.read(gemfile)
end