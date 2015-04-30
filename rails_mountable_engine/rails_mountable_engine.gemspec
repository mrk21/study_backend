$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_mountable_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_mountable_engine"
  s.version     = RailsMountableEngine::VERSION
  s.authors     = ["Yuichi Murata"]
  s.email       = ["mrk21info+github@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsMountableEngine."
  s.description = "TODO: Description of RailsMountableEngine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "pg"
end
