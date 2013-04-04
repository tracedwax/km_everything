# -*- encoding: utf-8 -*-
require File.expand_path('../lib/km_everything/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Trace Wax", "Justin Schier", "Alex Kramer", "Case Commons LLC"]
  gem.email         = ["gems@tracedwax.com"]
  gem.summary       = "Log Rails controller actions to KissMetrics"
  gem.homepage      = "https://github.com/tracedwax/km_everything"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "km_everything"
  gem.require_paths = ["lib"]
  gem.version       = KmEverything::VERSION

  gem.required_ruby_version = '>= 1.9.2'

  gem.add_development_dependency 'rspec', '~> 2.11'
end
