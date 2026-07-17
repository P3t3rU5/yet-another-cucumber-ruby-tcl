require_relative 'lib/cucumber/tcl/version'

Gem::Specification.new do |s|
  s.name        = 'yet-another-cucumber-tcl'
  s.version     = Cucumber::Tcl::VERSION
  s.authors     = ['Matt Wynne', 'Jon Owers', 'Barney Fisher']
  s.description = 'TCL plugin for Cucumber'
  s.summary     = "cucumber-tcl-#{s.version}"
  s.email       = 'pedro.miranda@gmail.com'
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/p3t3ru5/yet-another-cucumber-ruby-tcl#'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0.0'

  s.add_dependency 'cucumber'
  s.add_dependency 'yet-another-ruby-tcl', '~> 0.1.2'

  # s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n").grep_v(/\.gitignore$/)
  s.rdoc_options     = ['--charset=UTF-8']
  s.require_path     = 'lib'
  s.metadata['rubygems_mfa_required'] = 'true'
end
