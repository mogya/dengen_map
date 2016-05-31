FROM rails:4.2

RUN mkdir -p /usr/src/app
COPY ./Gemfile /usr/src/app/
COPY ./Gemfile.lock /usr/src/app/
WORKDIR /usr/src/app

RUN bundle install -j4

CMD ["sh", "/usr/src/app/start.sh"]
