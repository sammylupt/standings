module Standings
  class TableScraper
    class FetchError < StandardError; end
    class ParseError < StandardError; end

    attr_reader :league_selection

    def initialize(league_selection)
      @league_selection = league_selection
    end

    def call
      begin
        url = "https://www.theguardian.com/football/#{LeagueReference[league_selection][:league_full_name]}/table"
        site = Nokogiri::HTML(open(url))
      rescue
        throw FetchError
      end

      begin
        team_data = site.css('.table--league-table tbody tr')
        LeagueResults.new(league_selection).tap do |lr|
          lr.teams = build_teams(team_data)
        end
      rescue
        throw ParseError
      end
    end

    def build_teams(team_data_xml)
      team_data_xml.length.times.map do |i|
        source = team_data_xml[i].children.text
        team_info = source.split("\n").select { |s| s != "" }

        # ["1",
        #  "Chelsea",
        #  "12",
        #  "10",
        #  "2",
        #  "0",
        #  "30",
        #  "11",
        #  "19",
        #  "32",
        #  "Won against C Palace",
        #  "Drew with Man Utd",
        #  "Won against QPR",
        #  "Won against Liverpool",
        #  "Won against West Brom"]
        #Pos  Team  P W D L F A GD  Pts

        LeagueResults::Team.new({
          position: team_info[0].to_i,
          name: team_info[1],
          played: team_info[2].to_i,
          points: team_info[9].to_i
        })
      end
    end
  end
end
