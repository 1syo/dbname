# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dbname_generator/version'

Gem::Specification.new do |gem|
  gem.name          = "dbname_generator"
  gem.version       = DbnameGenerator::VERSION
  gem.authors       = ["TAKAHASHI Kazunari"]
  gem.email         = ["takahashi@1syo.net"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.licenses = ['MIT']

  gem.add_dependency 'grit', ['>= 2.4.0']

  gem.add_development_dependency 'rake', ['>= 0']
  gem.add_development_dependency 'rdoc', ['>= 0']
  gem.add_development_dependency 'rspec', ['>= 0']
end
