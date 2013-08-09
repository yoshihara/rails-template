gem "kaminari"
gem "bootstrap-sass"

gem_group :test do
  gem "rspec-rails" , "~> 2.0"
  gem "factory_girl_rails", :require => false
  gem "capybara"
end

gem_group :development do
  gem "i18n_generators"
  gem "pry-rails"
  gem "spring"
end

run "bundle install"

run "rails generate rspec:install"
run "rails generate i18n ja"
run "rails g i18n_translation ja"

application do
<<EOS
config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
EOS
end

remove_file "app/assets/stylesheets/application.css"
add_file "app/assets/stylesheets/application.css.scss", '@import "bootstrap";'
