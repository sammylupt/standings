#!/bin/env ruby
# encoding: utf-8

require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'trollop'
require 'pry'

require_relative '../lib/league.rb'
require_relative '../lib/displayer.rb'
require_relative '../lib/table_scraper.rb'
require_relative '../lib/team.rb'
#require_relative '../lib/standings.rb'


#Displayer.new.call