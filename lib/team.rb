class Team
  class << self
    attr_accessor :longest_team_name_length
  end

  attr_accessor :name, :position, :played, :points

  @@teams = []
  
  def initialize(info)
    @name = info[:name]
    @played = info[:played]
    @points = info[:points]
    @position = info[:position]
    @@teams << self
  end

  def top?
    self.position.to_i <= LeagueReference.top_teams
  end

  def middle?
    LeagueReference.middle_teams && self.position.to_i <= LeagueReference.middle_teams
  end

  def bottom?
    self.position.to_i >= (Team.teams_count - LeagueReference.bottom_teams + 1)
  end

  def self.teams
    @@teams
  end

  def self.teams_count
    @@teams.count
  end
 
  def self.get_longest_team_name_length
    self.longest_team_name_length ||= self.teams.sort_by {|t| t.name.length }.last.name.length
  end
 
end