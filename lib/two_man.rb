ENV['RACK_ENV'] ||= 'development'

# load path
lib_path = File.expand_path('../', __FILE__)
($:.unshift lib_path) unless ($:.include? lib_path)

# gems
require 'jenkins_api_client'
#require 'pi_piper'

# lib
require 'two_man/version'
require 'two_man/launcher'
#require 'two_man/indicator'
#require 'two_man/key'
#require 'two_man/keys'

# launch codes
Dir[File.dirname(__FILE__) + '/launch_code/*.rb'].each {|file| require file }