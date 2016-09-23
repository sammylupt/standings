module Standings
  class LeagueResults
    class Team < OpenStruct; end

    attr_accessor :league, :teams

    def initialize(league)
      @league = league
    end

    def top?(team)
      team.position <= LeagueReference[league][:top_teams]
    end

    def middle?(team)
      LeagueReference[league][:middle_teams] &&
      team.position <= LeagueReference[league][:middle_teams]
    end

    def bottom?(team)
      team.position >= (teams.count - LeagueReference[league][:bottom_teams] + 1)
    end
  end
end
