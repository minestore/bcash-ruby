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
  spec.homepage      = "http://minestore.com.br"
  spec.license       = "GNU V2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
