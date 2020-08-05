# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paypal-sdk/rest/version'

Gem::Specification.new do |gem|
  gem.name          = "paypal-sdk-rest-pmrb"
  gem.version       = PayPal::SDK::REST::VERSION
  gem.authors       = ["PayPal"]
  gem.email         = ["piers@varyonic.com"]
  gem.summary       = %q{The PayPal REST SDK provides Ruby APIs to create, process and manage payment.}
  gem.homepage      = "https://github.com/paypal-merchants-rb/PayPal-Ruby-SDK"
  
  gem.license       = "PayPal SDK License"

  gem.files         = Dir["{bin,spec,lib}/**/*"] + ["Rakefile", "README.md", "Gemfile"] + Dir["data/*"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('coveralls')
  gem.add_dependency('xml-simple')
  gem.add_dependency('multi_json', '~> 1.0')
end
