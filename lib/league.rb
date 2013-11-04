class League
  class << self
    attr_accessor :league_symbol, :league_full_name, :top_teams, :middle_teams, :bottom_teams, :longest_team_name_length
  end

  LeaguesHash = {
    :epl => {
      :full_name => "premierleague",
      :top_teams => 4,
      :middle_teams => 5,
      :bottom_teams => 3
    },
    :championship => {
      :full_name => "championship",
      :top_teams => 2,
      :middle_teams => 6,
      :bottom_teams => 3
    },
    :spl => {
      :full_name => "scottishpremierleague",
      :top_teams => 1,
      :middle_teams => 3,
      :bottom_teams => 2
    },
    :liga => {
      :full_name => "laligafootball",
      :top_teams => 3,
      :middle_teams => 6,
      :bottom_teams => 3
    },
    :ligue => {
      :full_name => "ligue1football",
      :top_teams => 3,
      :middle_teams => 4,
      :bottom_teams => 3
    },
    :seriea => {
      :full_name => "serieafootball",
      :top_teams => 3,
      :middle_teams => 5,
      :bottom_teams => 3
    },
    :bundesliga => {
      :full_name => "bundesligafootball",
      :top_teams => 4,
      :middle_teams => 6,
      :bottom_teams => 3
    }
  }

  @@teams = []

  def self.teams
    @@teams
  end

  def self.team_count
    teams.length
  end

  def self.set_league_info(league_selection)
    self.league_symbol = league_selection
    self.set_league_full_name
    self.set_top_teams
    self.set_middle_teams
    self.set_bottom_teams
  end

  def self.set_league_full_name
    self.league_full_name = League::LeaguesHash[league_symbol][:full_name]
  end

  def self.set_top_teams
    self.top_teams = League::LeaguesHash[league_symbol][:top_teams]
  end

  def self.set_middle_teams
    self.middle_teams = League::LeaguesHash[league_symbol][:middle_teams]
  end

  def self.set_bottom_teams
    self.bottom_teams = League::LeaguesHash[league_symbol][:bottom_teams]
  end

  def self.get_longest_team_name_length
    self.longest_team_name_length ||= self.teams.sort_by {|t| t.name.length }.last.name.length
  end
end
