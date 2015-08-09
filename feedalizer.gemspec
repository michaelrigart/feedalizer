# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feedalizer/version'

Gem::Specification.new do |spec|
  spec.name          = "feedalizer"
  spec.version       = Feedalizer::VERSION
  spec.authors       = ["Michaël Rigart", "Christoffer Sawicki"]
  spec.email         = ["michael@netronix.be"]

  spec.summary       = %q{Ruby library to transform web pages into RSS feeds.}
  spec.description   = %q{Feedalizer is a *small* Ruby library that glues together Hpricot with the standard RSS library in a way that makes it easy to transform web pages into RSS feeds. If you ask me, it makes it *too* easy.}
  spec.homepage      = "https://github.com/michaelrigart/feedalizer"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license       = 'MIT'

  spec.add_dependency "oga", "~> 1.2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
