class TableScraper
 
  attr_accessor :url, :teams
 
  def initialize
    @url = "http://www.theguardian.com/football/" + LeagueReference::league_full_name + "/table"
  end
 
  def call
    site = Nokogiri::HTML(open(self.url))
    self.teams = site.css('.table-football-body tr')[3..-1]
    build_teams
  end

  def build_teams
    teams.length.times do |i|
      source = teams[i].children
      Team.new({
        :name => source[2].children[-1].children.text,
        :played => source[4].children.text,
        :points => source[-2].text,
        :position => source[0].children.text
      })
    end
  end

end