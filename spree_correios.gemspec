# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_correios'
  s.version     = '1.0.7'
  s.summary     = %q{A spree extensions to add Brazil's Correio calculators}
  s.required_ruby_version = '>= 1.8.7'

  s.authors     = ["Stefano Diem Benatti"]
  s.email       = ["stefano.diem@gmail.com"]
  s.homepage    = "http://github.com/heavenstudio/spree_correios"

  s.test_files  = Dir['spec/**/*.rb'] - Dir['spec/dummy/**/*.rb']
  s.test_files += ['Guardfile']
  s.files       = Dir['app/**/*.rb', 'lib/**/*.rb', 'config/**/*']
  s.files      += ['Gemfile', 'Gemfile.lock', 'Rakefile',
                   'LICENSE', 'README.md']

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 1.0.0'
  s.add_dependency 'correios-frete', '~> 1.9.4'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'shoulda-matchers',  '1.1.0'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'fakeweb'
end
