# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'visualcaptcha/version'

Gem::Specification.new do |gem|
  gem.name          = "visualcaptcha"
  gem.version       = VisualCaptcha::VERSION
  gem.authors       = ["Trevor Kimenye"]
  gem.email         = ["trevor@sprout.co.ke"]
  gem.description   = %q{A captcha that uses images instead of garbled text}
  gem.summary       = %q{A captcha that uses images instead of garbled text}
  gem.homepage      = "https://github.com/kimenye/visualcaptcha"
  gem.files         = Dir["{lib,vendor}/**/*"] + ["LICENSE.txt", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "railties", "~> 3.1"
  gem.add_dependency "jquery-ui-rails"
end
