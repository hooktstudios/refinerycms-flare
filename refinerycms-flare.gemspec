# Encoding: UTF-8
Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-flare'
  s.version           = '0.0.0'
  s.description       = 'Advanced page parts options for RefineryCMS pages.'
  s.date              = '2013-02-13'
  s.summary           = 'Flare extension for Refinery CMS'

  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.9'
  s.add_dependency             'simple_form'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.9'
end
