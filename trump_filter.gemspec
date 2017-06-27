# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trump_filter/version'

Gem::Specification.new do |spec|
  spec.name          = "trump_filter"
  spec.version       = TrumpFilter::VERSION
  spec.authors       = ["Ben Greenberg"]
  spec.email         = ["thetrumpfilter@gmail.com"]

  spec.summary       = %q{See the latest news as filtered through President Trump's tweets.}
  spec.description   = %q{This gem will take the latest headline news and the latest POTUS tweet and show them side by side so you can get a live glimpse into the Trump mindset.}
  spec.homepage      = "https://github.com/benhayehudi"
  spec.license       = "MIT"


  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #  f.match(%r{^(test|spec|features)/})
  #end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "nokogiri"
  spec.add_dependency "puma"
  spec.add_dependency "sinatra"
  spec.add_dependency "rake"
  spec.add_dependency "shotgun"
end
