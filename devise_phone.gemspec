$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise_phone/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_phone"
  s.version     = DevisePhone::VERSION
  s.authors     = ["Yann-Cyril PELUD"]
  s.email       = ["ypelud@gmail.com"]
  s.homepage    = "https://github.com/ypelud/devise_phone"
  s.summary     = "Add phone to devise model."
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "require"
  
  s.add_development_dependency "sqlite3"
end
