mkdir -p /app/log/nginx/
if [ "$NODE_ENV" = "development" ]
then
  echo 'start bash.'
  /bin/bash && tail -f /dev/null
else
  echo 'start bash for production(temporary).'
  /bin/bash && tail -f /dev/null
fi
