# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'faraday-stack'
  gem.version = '0.1.5'

  gem.add_dependency 'faraday', ['>= 0.6', '< 0.8']
  # gem.add_development_dependency 'rspec', '~> 1.2.9'

  gem.summary = "Great Faraday stack for consuming all kinds of APIs"
  # gem.description = "Longer description."

  gem.authors  = ['Mislav Marohnić']
  gem.email    = 'mislav.marohnic@gmail.com'
  gem.homepage = 'https://github.com/mislav/faraday-stack'

  # gem.executables = %w( faraday-stack )
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end
