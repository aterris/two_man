#!/usr/bin/env ruby
# encoding: utf-8

require './lib/two_man'
require "thor"

# Usage:
#
#  chmod +x two_man.rb
#  ./two_man.rb Basic
#

module TwoMan
  class CLI < Thor
    package_name "Two-Man CLI"

    desc "install", "Installs launch codes"
    def install(url)
      puts "install #{url}"
    end

    desc "start", "Start Two-Man Rule Launcher"
    def start(launch_code)
      TwoMan::Launcher.new(args.first, @key_offset_time)
    end 

  end
end

TwoMan::CLI.start