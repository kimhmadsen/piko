# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'piko/version'

Gem::Specification.new do |gem|
  gem.name          = "piko"
  gem.version       = Piko::VERSION
  gem.authors       = ["Kim H Madsen"]
  gem.email         = ["kim@undo.dk"]
  gem.description   = "This a lib for working with PIKO Inverter from kostal-solar-electric.com" #%q{TODO: Write a gem description}
  gem.summary       = "This a lib for working with PIKO Inverter from kostal-solar-electric.com"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

