# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dbcp/version'

Gem::Specification.new do |spec|
  spec.name          = "dbcp"
  spec.version       = Dbcp::VERSION
  spec.authors       = ["Gabe Martin-Dempesy"]
  spec.email         = ["gabetax@gmail.com"]
  spec.description   = %q{Copy SQL databases between application environments}
  spec.summary       = %q{}
  spec.homepage      = "https://github.com/gabetax/dbcp"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "virtus", "~> 1.0.2"
  spec.add_dependency "net-ssh", "~> 2.8.0"
  spec.add_dependency "net-sftp", "~> 2.1.2"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "capistrano", "~> 3.1"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
  # Rake 10.2.0 conflicts with `TypeError: no implicit conversion of Rake::Task into String`
  # https://github.com/capistrano/capistrano/pull/983
  spec.add_development_dependency "rake", "10.1.1"
  spec.add_development_dependency "pry"
end
