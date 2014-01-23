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

  opts.on( '-t', '--time TIME', "Allowed Key Offset Time \t\tDefault: 50(ms), Maximum: 500(ms)" ) do |time|
    @key_offset_time = time || 50
  end

end
parser.parse!

def main(args)
  puts "No Launch Code Provided!" if args.first.nil?
  raise "Invalid Key Offset Time" if @key_offset_time > 500

  TwoMan::Launcher.new(args.first, @key_offset_time)
end

main(ARGV)
exit 0