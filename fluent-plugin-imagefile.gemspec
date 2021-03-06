# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-imagefile"
  spec.version       = '0.0.1'
  spec.authors       = ["bash0C7"]
  spec.email         = ["koshiba+github@4038nullpointer.com"]
  spec.description   = "Output plugin to save image file from massages attribute value"
  spec.summary       = "Output plugin to save image file from massages attribute value"
  spec.homepage      = "https://github.com/bash0C7/fluent-plugin-imagefile"
  spec.license       = "Ruby's"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "fluentd"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rr"
  spec.add_development_dependency "pry"
end
