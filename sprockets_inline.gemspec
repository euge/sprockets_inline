# -*- encoding: utf-8 -*-
require File.expand_path("../lib/sprockets_inline/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "sprockets_inline"
  s.version     = SprocketsInline::VERSION
  s.authors     = ["Euge Gimelberg"]
  s.email       = ["eugegim@gmail.com"]
  s.homepage    = "https://github.com/euge/sprockets_inline"
  s.summary     = "Sprockets processor to inline JavaScripts"
  s.description = "SprocketsInline provides a Sprockets directive processor for inlining JavaScripts"

  s.rubyforge_project = "sprockets_inline"

  s.files         = Dir["README.md", "LICENSE", "lib/**/*.rb"]
  s.executables   = []
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rake"
  s.add_development_dependency "bundler", [">= 0"]
  s.add_development_dependency "rspec", ["~> 2.8.0"]
  
  s.add_dependency "sprockets"
end
