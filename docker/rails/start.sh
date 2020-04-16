mkdir -p log/unicorn/
mkdir -p log/nginx/
if [ "$RAILS_ENV" = "development" ]
then
  export GEM_HOME=/rails/vendor/bundle
  export PATH=$GEM_HOME/bin:$PATH
  bundle config --local path "$GEM_HOME"
  bundle config --local bin "$GEM_HOME/bin"
  export BUNDLE_APP_CONFIG=$GEM_HOME
  gem install bundler
  bundle install -j4 --retry=3
  bundle exec rake db:gis:setup
  bin/setup
  bin/rails db:seed
  bin/rails s -p $PORT -b 0.0.0.0 &
else
  bin/rails s -p $PORT -b 0.0.0.0 &
fi
tail -f /dev/null
