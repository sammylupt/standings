Gem::Specification.new do |s|
  s.name        = 'standings'
  s.version     = '1.0'
  s.executables << 'standings'
  s.summary     = "football/soccer standings"
  s.description = "View European football/soccer standings from your terminal. Currently supports English Premier League, Championship, League One and Two, Scottish Premiership, La Liga, Ligue 1, Serie A, and Bundesliga"
  s.authors     = ["Scott Luptowski"]
  s.email       = 'scottluptowski@gmail.com'
  s.files       =  Dir["{lib}/**/*"]
  s.homepage    =
    'http://www.github.com/scottluptowski/standings'
  s.license       = 'MIT'
  s.add_runtime_dependency('nokogiri')
  s.add_runtime_dependency('colorize')
  s.add_runtime_dependency('trollop')
end
