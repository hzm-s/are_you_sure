$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "are_you_sure/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "are_you_sure"
  s.version     = AreYouSure::VERSION
  s.authors     = ["haazime"]
  s.email       = ["h4zime@gmail.com"]
  s.homepage    = "https://github.com/haazime"
  s.summary     = "Add confirmation to Rails"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
end
