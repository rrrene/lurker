# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lurker/version'

Gem::Specification.new do |spec|
  spec.name          = "lurker"
  spec.version       = Lurker::VERSION
  spec.authors       = ["Vlad Bokov"]
  spec.email         = ["razum2um@mail.ru"]
  spec.summary       = %q{Lukrs into your API rquest to tell you the truth.}
  spec.description   = %q{It hooks in rspec controller methods to check theirs schema and let people try it}
  spec.homepage      = "http://github.com/razum2um/lurker"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency("json")
  spec.add_dependency("json-schema", "~> 2.2")
  spec.add_dependency("kramdown")
  spec.add_dependency("thor")
  spec.add_dependency("diffy")
  spec.add_dependency("sinatra")

  # build template
  spec.add_development_dependency("sprockets")
  spec.add_development_dependency("sass")
  spec.add_development_dependency("bootstrap-sass", '~> 3.1.1')
  spec.add_development_dependency("jquery-rails")
  spec.add_development_dependency("remotipart")

  spec.add_development_dependency("bundler", "~> 1.5")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec")
  spec.add_development_dependency("pry-debugger")
  spec.add_development_dependency("pry-stack_explorer")
  spec.add_development_dependency("fuubar")
end