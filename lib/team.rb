class Team
  attr_accessor :name, :position, :played, :points
 
  @@teams = []
 
  def initialize(info)
    @name = info[:name]
    @played = info[:played]
    @points = info[:points]
    @position = info[:position]
    @@teams << self
  end
 
  def self.all
    @@teams
  end
 
end