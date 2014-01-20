ENV['RACK_ENV'] ||= 'development'

# load path
lib_path = File.expand_path('../', __FILE__)
($:.unshift lib_path) unless ($:.include? lib_path)

# gems
require 'jenkins_api_client'
#require 'pi_piper'

# lib
require 'two_man/version'

# launch codes
Dir[File.dirname(__FILE__) + '/launch_codes/*.rb'].each {|file| require file }

module TwoMan
end