mkdir -p log/unicorn/
mkdir -p log/nginx/
mkdir -p db/postgres/data
echo 'rake db:migrate'
bundle exec rake db:migrate
if [ "$RAILS_ENV" == "development" ]
then
  echo 'start bash.'
  /bin/bash
else
  echo 'rake assets:precompile...'
  bundle exec rake assets:precompile
  echo 'start unicorn server.'
  bundle exec unicorn -c /app/config/unicorn.rb
fi
