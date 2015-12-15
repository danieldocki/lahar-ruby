# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lahar/version'

Gem::Specification.new do |spec|
  spec.name          = "lahar"
  spec.version       = Lahar::VERSION
  spec.authors       = ["Daniel Docki"]
  spec.email         = ["daniel.docki@gmail.com"]

  spec.summary       = "Ruby API wrapper for Lahar"
  spec.description   = "Ruby API wrapper for Lahar"
  spec.homepage      = "http://www.lahar.com.br"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.12"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
