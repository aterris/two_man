ENV['RACK_ENV'] ||= 'development'

# load path
lib_path = File.expand_path('../', __FILE__)
($:.unshift lib_path) unless ($:.include? lib_path)

# gems
#require 'jenkins_api_client'
#require 'pi_piper'
require 'active_support/inflector'

# lib
require 'two_man/version'
require 'two_man/command'
require 'two_man/launcher'
require 'two_man/indicator'
require 'two_man/key'
require 'two_man/switch'

# launch codes
Dir[File.dirname(__FILE__) + '/launch_code/*.rb'].each {|file| require file }