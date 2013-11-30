class LeagueReference
  class << self
    attr_accessor :league_symbol, :league_full_name, :top_teams, :middle_teams, :bottom_teams
  end

  LeaguesHash = {
    :epl => {
      :league_full_name => "premierleague",
      :top_teams => 4,
      :middle_teams => 5,
      :bottom_teams => 3
    },
    :championship => {
      :league_full_name => "championship",
      :top_teams => 2,
      :middle_teams => 6,
      :bottom_teams => 3
    },
    :spl => {
      :league_full_name => "scottishpremierleague",
      :top_teams => 1,
      :middle_teams => 3,
      :bottom_teams => 2
    },
    :liga => {
      :league_full_name => "laligafootball",
      :top_teams => 3,
      :middle_teams => 6,
      :bottom_teams => 3
    },
    :ligue => {
      :league_full_name => "ligue1football",
      :top_teams => 3,
      :middle_teams => 4,
      :bottom_teams => 3
    },
    :seriea => {
      :league_full_name => "serieafootball",
      :top_teams => 3,
      :middle_teams => 5,
      :bottom_teams => 3
    },
    :bundesliga => {
      :league_full_name => "bundesligafootball",
      :top_teams => 4,
      :middle_teams => 6,
      :bottom_teams => 3
    }
  }

  def self.set_league_info(league_selection)
    self.league_symbol = league_selection
    ["league_full_name", "top_teams", "middle_teams", "bottom_teams"].each do |attr|
      self.send("#{attr}=", LeaguesHash[league_symbol][attr.to_sym])
    end
  end
end