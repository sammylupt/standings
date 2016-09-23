module Standings
  class CLI
    def initialize
      league_selection = accept_input

      if league_selection
        handle_valid_league_selection(league_selection)
      else
        handle_help_message
      end
    end

    def accept_input
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
        opt :epl, "🇬🇧  English Premier League", short: :e
        opt :championship, "🇬🇧  English Championship", short: :c
        opt :league1, "🇬🇧  English League One", short: :o
        opt :league2, "🇬🇧  English League Two", short: :t
        opt :spl, "🇬🇧  Scottish Premiership", short: :s
        opt :liga, "🇪🇸  La Liga", short: :l
        opt :ligue, "🇫🇷  Ligue 1", short: :f
        opt :seriea, "🇮🇹  Seria A", short: :i
        opt :bundesliga, "🇩🇪  Bundesliga", short: :d
      end

      opts.keys.detect { |k| opts[k] }
    end

    def handle_valid_league_selection(league_selection)
      begin
        results = TableScraper.new(league_selection).call
        Displayer.new(results).display_table
      rescue TableScraper::FetchError, TableScraper::ParseError
        handle_failure
      end
    end

    def handle_help_message
      puts "⚽  Standings requires you to pass in the flag of a league. Run with --help for help."
    end

    def handle_failure
      puts "⚽  There was an error retrieving the scores!"
    end
  end
end
