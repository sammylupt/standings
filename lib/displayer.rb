class Displayer
 
  def initialize
    display_table
  end
 
  def template(team)
    string = "#{(team.position).ljust(3," ")} #{team.played.ljust(3, " ")} #{team.points.to_s.ljust(5, " ")}"

    if team.top?
      string += team.name.green
    elsif team.middle?
      string += team.name.light_blue
    elsif team.bottom?
      string += team.name.red
    else
      string += team.name
    end

  end
 
  def display_table
    puts dashes_for_display_table
    puts "#   P  Pts   Team"
    puts dashes_for_display_table
    League.teams.each { |team| puts template(team)  } 
    puts dashes_for_display_table
  end

  def dashes_for_display_table
    # draw enough dashes so that teams with long names are still covered by the dashes. Given a team length integer, add it to 17 (the length of line 25)
    "-" * (17 + League.get_longest_team_name_length)
  end

end