#!/bin/env ruby
# encoding: utf-8

require_relative '../config/environment'
opts = Trollop::options do
  version <<-EOS

⚽  Standings 
Version 0.2.5 | November 2014
Scott Luptowski | @scottluptowski

EOS
  banner <<-EOS
\n⚽  Standings is a command line gem which lets users check the current standings in a number of European football/soccer leagues. The data is scraped and thus subject to availability.

Usage:
\n

EOS
  opt :epl, "🇬🇧  English Premier League"
  opt :championship, "🇬🇧  English Championship"
  opt :spl, "🇬🇧  Scottish Premier League"
  opt :liga, "🇪🇸  La Liga"
  opt :ligue, "🇫🇷  Ligue 1"
  opt :seriea, "🇮🇹  Seria A"
  opt :bundesliga, "🇩🇪  Bundesliga"
end

league_selection = opts.keys.detect { |k| opts[k] }

if league_selection
  LeagueReference.set_league_info(league_selection)
  TableScraper.new.call
  Displayer.new.call
else 
  puts "⚽  Standings requires you to pass in the flag of a league. Run with --help for help."
end