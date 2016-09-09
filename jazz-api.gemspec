# coding: utf-8
require File.join(File.dirname(__FILE__), 'lib/jazz-api/version.rb')

Gem::Specification.new do |spec|
  spec.name          = "jazz-api"
  spec.version       = Jazz::VERSION
  spec.authors       = ["Andri Kurnia"]
  spec.email         = ["andrikurnia@live.com"]

  spec.summary       = %q{Simple Jazz api ruby wrapper}
  spec.description   = %q{Simple Jazz api ruby wrapper}
  spec.homepage      = "https://github/andrkrn/jazz-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'httparty', '~> 0.14'
  spec.add_runtime_dependency 'activesupport', '~> 4.2', '>= 4.2.0'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
