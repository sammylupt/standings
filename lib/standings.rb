#!/bin/env ruby
# encoding: utf-8

require_relative '../config/environment'
opts = Trollop::options do
  opt :epl, "🇬🇧  English Premier League"
  opt :championship, "🇬🇧  English Championship"
  opt :spl, "🇬🇧  Scottish Premier League"
  opt :liga, "🇪🇸  La Liga"
  opt :ligue, "🇫🇷  Ligue 1"
  opt :seriea, "🇮🇹  Seria A"
  opt :bundesliga, "🇩🇪  Bundesliga"
end

league_selection = opts.keys.detect { |k| opts[k] }

if !league_selection
  puts "You must enter in a command. Run with --help for help."
else
  League.set_league_info(league_selection)
  TableScraper.new(League::league_full_name)
  Displayer.new
end