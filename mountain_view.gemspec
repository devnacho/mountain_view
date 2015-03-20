$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mountain_view/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mountain_view"
  s.version     = MountainView::VERSION
  s.authors     = ["Ignacio Gutierrez", "Esteban Pastorino"]
  s.email       = ["nachojgutierrez@gmail.com", "ejpastorino@gmail.com"]
  s.homepage    = "http://github.com/jgnatch/mountain_view"
  s.summary     = "View components for Rails."
  s.description = "View components for Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency "sqlite3"
end
