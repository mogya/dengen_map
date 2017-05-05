mkdir -p log/unicorn/
mkdir -p log/nginx/
mkdir -p db/postgres/data
mkdir -p db/mysql/data
echo 'rake db:migrate'
bundle exec rake db:gis:setup
bundle exec rake db:migrate
if [ "$RAILS_ENV" == "development" ]
then
  echo 'start bash.'
  /bin/bash && tail -f /dev/null
else
  echo 'rake assets:precompile...'
  bundle exec rake assets:precompile
  echo 'start unicorn server.'
  rm /app/tmp/unicorn.pid
  bundle exec unicorn -c /app/docker/app/unicorn.rb
fi
