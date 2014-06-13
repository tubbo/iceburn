$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "iceburn/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "iceburn"
  s.version     = Iceburn::VERSION
  s.authors     = ["Tom Scott"]
  s.email       = ["tubbo@psychedeli.ca"]
  s.homepage    = "http://github.com/tubbo/iceburn"
  s.summary     = "HTTP request hijacker for ActionController and API-driven Rails apps"
  s.description = s.summary
  s.license     = "NCSA"

  s.files = `git ls-files`.split("\n")
  s.test_files = s.files.grep(/\Aspec/)

  s.add_dependency "rails"

  s.add_development_dependency "pg"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
end
