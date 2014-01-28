# load path
lib_path = File.expand_path('../', __FILE__)
($:.unshift lib_path) unless ($:.include? lib_path)

# gems
#require 'pi_piper'
require 'active_support/inflector'
require 'fileutils'
require 'git'

# lib
require 'two_man/version'
require 'two_man/command'
require 'two_man/launcher'
require 'two_man/indicator'
require 'two_man/key'
require 'two_man/switch'

# launch codes
TwoMan::Command.launch_codes.each {|file| require file }