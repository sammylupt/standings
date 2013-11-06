class Displayer
 
  def call
    display_table
  end
 
  def template(team)
    output = "#{(team.position).ljust(3," ")} #{team.played.ljust(3, " ")} #{team.points.to_s.ljust(5, " ")}"

    if team.top?
      output += team.name.green
    elsif team.middle?
      output += team.name.light_blue
    elsif team.bottom?
      output += team.name.red
    else
      output += team.name
    end
  end
 
  def display_table
    puts dashes_for_display_table
    puts "#   P  Pts   Team"
    puts dashes_for_display_table
    Team::teams.each { |team| puts template(team); sleep 0.01  } 
    puts dashes_for_display_table
  end

  def dashes_for_display_table
    # draw enough dashes so that teams with long names are still covered by the dashes. Given a team length integer, add it to 17 (the length of the static puts statement in #display_table)
    "-" * (17 + Team.get_longest_team_name_length)
  end

end