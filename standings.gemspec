Gem::Specification.new do |s|
  s.name        = 'standings'
  s.version     = '0.1.2'
  s.executables << 'standings'
  s.date        = '2010-10-21'
  s.summary     = "BPL table"
  s.description = "View the current table of the Barclays Premier League from your terminal"
  s.authors     = ["Scott Luptowski"]
  s.email       = 'scottluptowski@gmail.com'
  s.files       =  Dir["{config}/*", "{lib}/**/*"]
  s.homepage    =
    'http://www.github.com/scottluptowski/standings'
  s.license       = 'MIT'
  s.add_runtime_dependency('nokogiri')
  s.add_runtime_dependency('colorize')
end