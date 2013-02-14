source "http://rubygems.org"

gemspec

gem 'refinerycms', '~> 2.0.9'
gem 'refinerycms-i18n'
gem 'refinerycms-pages'

# Database Configuration
platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'activerecord-jdbcmysql-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'jruby-openssl'
end

platforms :ruby do
  gem 'sqlite3'
  gem 'mysql2'
end

group :development, :test do
  gem 'refinerycms-testing'
  gem 'rb-fsevent'
  gem 'guard-rspec', '~> 0.7.0'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'debugger'

  platforms :ruby do
    gem 'spork', '~> 0.9.0'
    gem 'guard-spork', '~> 0.5.2'
  end
end

gem 'simple_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails', '~> 2.0.0'
