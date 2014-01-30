# load path
lib_path = File.expand_path('../', __FILE__)
($:.unshift lib_path) unless ($:.include? lib_path)

# gems
#require 'pi_piper'
require 'sinatra/base'
require 'active_support/inflector'
require 'rainbow/ext/string'
require 'fileutils'
require 'git'

# lib
require 'two_man/version'
require 'two_man/command'
require 'two_man/launcher'
require 'two_man/indicator'
require 'two_man/key'
require 'two_man/switch'
require 'two_man/web'

# launch codes
TwoMan::Command.launch_codes.each {|file| require file }