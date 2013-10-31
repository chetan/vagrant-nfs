# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-nfs/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-nfs"
  spec.version       = VagrantPlugins::NFS::VERSION
  spec.authors       = ["Chetan Sarva"]
  spec.email         = ["chetan@pixelcop.net"]
  spec.description   = %q{A Vagrant plugin that ensures NFS client packages are installed.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/chetan/vagrant-nfs"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
