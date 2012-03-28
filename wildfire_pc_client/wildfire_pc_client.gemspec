# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "wildfire_pc_client"
  s.summary     = "Lets developers use the Super Bike web service"
  s.description = "Use it wisely"
  s.authors     = ["Bernardo Telles"]
  s.email       = 'bernie.telles@wildfireapp.com'
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
  s.require_path = 'lib'

  s.add_runtime_dependency 'rails', '~> 3.2.0'
end
