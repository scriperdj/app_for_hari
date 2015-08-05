source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Additional gems
gem "carrierwave", "~> 0.6.2"
#gem "rmagick"
gem "mini_magick", "~> 3.4"
gem 'gravatar_image_tag'
gem 'will_paginate'
gem 'devise'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  #gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development do
	gem 'rspec-rails', '~> 3.0'
	gem 'faker', '1.4.3'
end

group :test do
	gem 'rspec', '~> 3.0'
	gem 'factory_girl_rails'
	gem 'database_cleaner'
	gem "capybara", "~> 2.2.0"
end

group :production do
	gem 'rails_12factor'
	gem 'rails_serve_static_assets'
	gem 'rails_stdout_logging'
end
