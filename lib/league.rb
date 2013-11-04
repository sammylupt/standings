class League
  class << self
    attr_accessor :league_symbol, :league_full_name, :top_teams, :middle_teams, :bottom_teams
  end

  @@all = []

  def self.all
    @@all
  end

  def self.team_count
    all.length
  end

  LeaguesHash = {
    :epl => {
      :fullname => "premierleague",
      :topteams => 4,
      :middleteams => 5,
      :bottomteams => 3
    },
    :championship => {
      :fullname => "championship",
      :topteams => 2,
      :middleteams => 6,
      :bottomteams => 3
    },
    :spl => {
      :fullname => "scottishpremierleague",
      :topteams => 1,
      :middleteams => 3,
      :bottomteams => 2
    },
    :liga => {
      :fullname => "laligafootball",
      :topteams => 3,
      :middleteams => 6,
      :bottomteams => 3
    },
    :ligue => {
      :fullname => "ligue1football",
      :topteams => 3,
      :middleteams => 4,
      :bottomteams => 3
    },
    :seriea => {
      :fullname => "serieafootball",
      :topteams => 3,
      :middleteams => 5,
      :bottomteams => 3
    },
    :bundesliga => {
      :fullname => "bundesligafootball",
      :topteams => 4,
      :middleteams => 6,
      :bottomteams => 3
    }
  }

  def self.set_league_info(league_selection)
    self.league_symbol = league_selection
    self.set_league_full_name
    self.set_top_teams
    self.set_middle_teams
    self.set_bottom_teams
  end

  def self.set_league_full_name
    self.league_full_name = League::LeaguesHash[league_symbol][:fullname]
  end

  def self.set_top_teams
    self.top_teams = League::LeaguesHash[league_symbol][:topteams]
  end

  def self.set_middle_teams
    self.middle_teams = League::LeaguesHash[league_symbol][:middleteams]
  end

  def self.set_bottom_teams
    self.bottom_teams = League::LeaguesHash[league_symbol][:bottomteams]
  end
end
