class TableScraper
 
  attr_accessor :url, :teams
 
  def initialize(league)
    @url = "http://www.theguardian.com/football/" + league + "/table"
    call
  end
 
  def call
    threader
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

  def threader
  end
end