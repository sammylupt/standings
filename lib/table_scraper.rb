class TableScraper
 
  attr_accessor :url, :teams
 
  def initialize
    @url = "http://www.theguardian.com/football/" + LeagueReference::league_full_name + "/table"
  end
 
  def call
    site = Nokogiri::HTML(open(@url))
    self.teams = site.css('.table--league-table tbody tr')
    build_teams
  end

  def build_teams
    teams.length.times do |i|
      source = teams[i].children.text
      team_data = source.split("\n").select { |s| s != "" }

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

      Team.new({
        :position => team_data[0],
        :name => team_data[1],
        :played => team_data[2],
        :points => team_data[9]
      })
    end
  end

end