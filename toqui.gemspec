$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "toqui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "toqui"
  s.version     = Toqui::VERSION
  s.authors     = ["Sebastian Gonzalez"]
  s.email       = ["sebagonz91@gmail.com"]
  s.homepage    = ""
  s.summary     = "User-related logic automated"
  s.description = "Toqui will take care of authentication, passwords, recovery and more. Never again implement this."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"
  s.add_dependency "bcrypt", "~> 3.1.7"
  
  s.add_development_dependency "sqlite3"
end
