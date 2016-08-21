# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'need_for_type/version'

Gem::Specification.new do |spec|
  spec.name          = "need_for_type"
  spec.version       = NeedForType::VERSION
  spec.authors       = ["tiagonbotelho", "jbamaro"]
  spec.email         = ["tiagonbotelho@gmail.com", "jbamaro95@gmail.com"]

  spec.summary       = %q{A terminal typeracer}
  spec.description   = %q{A terminal typeracer}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = Dir['README.md', 'Gemfile', 'lib/**/*', 'assets/**/*.txt']
  spec.bindir        = "bin"
  spec.executables   = ['need_for_type']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
