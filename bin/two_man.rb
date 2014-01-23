#!/usr/bin/env ruby
# encoding: utf-8

require './lib/two_man'
require 'optparse'

# Usage:
#
#  chmod +x two_man.rb
#  ./two_man.rb Basic
#

# Build Command Line Options
parser = OptionParser.new do |opts|
  opts.banner = 'Two Man Rule Launcher'

  #opts.on( '-d', '--database DATABASE', [:dynamo_db, :riak], "Database Type: \t\t(required: dynamod_db or riak)" ) do |database|
  #  @database = database
  #end

end
parser.parse!

def main(args)
  puts "No Launch Code Provided!" if args.first.nil?
  TwoMan::Launcher.new(args.first)
end

main(ARGV)
exit 0