class Team
  attr_accessor :name, :position, :played, :points
  
  def initialize(info)
    @name = info[:name]
    @played = info[:played]
    @points = info[:points]
    @position = info[:position]
    League.teams << self
  end
 
  def top?
    self.position.to_i <= League.top_teams
  end

  def middle?
    League.middle_teams && self.position.to_i <= League.middle_teams
  end

  def bottom?
    self.position.to_i >= League.team_count - (League.bottom_teams - 1)
  end
 
end