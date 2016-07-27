# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ret-urn-er/version'

Gem::Specification.new do |spec|
  spec.name          = 'retURNer'
  spec.version       = RetURNer::VERSION
  spec.authors       = ['fho-wtag']
  spec.email         = ['faruk.hossain@welltravel.com']

  spec.summary       = 'summary'
  spec.description   = 'description'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
