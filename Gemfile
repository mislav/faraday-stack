source "http://rubygems.org"

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'nokogiri', :platforms => :ruby
  # ActiveSupport::JSON will be used in ruby 1.8 and Yajl in 1.9; this is to test against both adapters
  gem 'activesupport', '~> 2.3.8', :require => nil, :platforms => [:ruby_18, :jruby]
  gem 'yajl-ruby', :require => 'yajl', :platforms => :ruby_19
  gem 'rack-cache'
end

# gem 'faraday', '~> 0.6', :path => "/Users/mislav/.coral/faraday-technoweenie"
gemspec
