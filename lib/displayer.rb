module Standings
  class Displayer
    attr_reader :results

    def initialize(results)
      @results = results
    end

    def display_table
      puts dashes_for_display_table
      puts "#   GP  Pts  W    D    L   Team"
      puts dashes_for_display_table

      results.teams.each do |team|
        puts template(team)
        sleep 0.01
      end

      puts dashes_for_display_table
    end

    def template(team)
      output =
        "#{(team.position.to_s).ljust(3," ")} " \
        "#{team.played.to_s.ljust(3, " ")} " \
        "#{team.points.to_s.ljust(5, " ")}" \
        "#{team.wins.to_s.ljust(5, " ")}" \
        "#{team.draws.to_s.ljust(5, " ")}" \
        "#{team.losses.to_s.ljust(5, " ")}"

      if results.top?(team)
        output += team.name.green
      elsif results.middle?(team)
        output += team.name.light_blue
      elsif results.bottom?(team)
        output += team.name.red
      else
        output += team.name
      end
    end

    private

    def dashes_for_display_table
      # draw enough dashes so that teams with long names are still covered
      # by the dashes. Given a team length integer, add it to 31
      # (the length of the static puts statement in #display_table)
      "-" * (31 + longest_team_name_length)
    end

    def longest_team_name_length
      results.teams.map {|t| t.name.length }.max
    end
  end
end
