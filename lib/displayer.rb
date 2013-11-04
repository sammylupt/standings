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
    puts string
  end
 
  def display_table
    puts "-" * 28
    puts "#   P  Pts   Team"
    puts "-" * 28
    League.all.each { |team| template(team)  } 
  end

end