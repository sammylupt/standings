class Displayer
 
  def call 
    TableScraper.new.call
    display_table
  end
 
  def template(team)
    string = "#{(team.position).ljust(3," ")} #{team.played.ljust(3, " ")} #{team.points.ljust(5, " ")}"
    if team.position.to_i <= 4
      string += team.name.green
    elsif team.position.to_i >= 18
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
    Team.all.each { |team| template(team)  } 
  end
 
end