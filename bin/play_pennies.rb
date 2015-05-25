#!/usr/bin/env ruby
require_relative '../lib/game'

if ARGV.empty?
  puts 'please input the number of pennies you want to start with'
  exit
else
  Game.new(ARGV[0]).play!
end
