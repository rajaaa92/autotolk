# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autotolk/version'

Gem::Specification.new do |spec|
  spec.name          = "autotolk"
  spec.version       = Autotolk::VERSION
  spec.authors       = ["Joanna Rajewska"]
  spec.email         = ["contact@rajewska.asia"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{This gem makes locales in tolk translate automatically (using bing).}
  spec.homepage      = "https://github.com/rajaaa92/autotolk"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "bing_translator", "~> 4.4.0"
end

