# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tomdoccery/version'

Gem::Specification.new do |spec|
  spec.name          = "tomdoccery"
  spec.version       = Tomdoccery::VERSION
  spec.authors       = ["Tim"]
  spec.email         = ["thogg4@gmail.com"]
  spec.description   = %q{tomdoccery}
  spec.summary       = %q{tomdoccery}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'sinatra'
  spec.add_dependency 'slim'
  spec.add_dependency 'tomparse'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
