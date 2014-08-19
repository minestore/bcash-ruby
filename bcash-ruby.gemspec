# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bcash/version'

Gem::Specification.new do |spec|
  spec.name          = "bcash-ruby"
  spec.version       = Bcash::VERSION
  spec.authors       = ["Raphael Costa"]
  spec.email         = ["raphael@minestore.com.br"]
  spec.summary       = %q{Wrapper gem to handle BCash and account creation}
  spec.description   = %q{Use this gem to create/search accounts or create transcations using Bcash API}
  spec.homepage      = "http://minestore.com.br"
  spec.license       = "GNU V2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency "httparty", '~> 0.13', '>= 0.13.0'
  spec.add_dependency 'multi_json', '~> 1.0'
  spec.add_dependency 'oauth', '~> 0.4'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.3', '>= 10.3.2'
  spec.add_development_dependency 'vcr', '~> 2.9', '>= 2.9.2'
  spec.add_development_dependency 'webmock', '~> 1.18', '>= 1.18.0'
  spec.add_development_dependency 'rspec', '~> 3.0.0', '>= 3.0.0'
end
