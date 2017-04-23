FROM centos
RUN yum -y update && yum install -y \
  git patch which curl \
  postgresql postgresql-devel postgresql-libs \
  sqlite sqlite-devel \
  build-essential libxml2-dev libxslt1-dev \
  libjpeg-devel libpng-devel ImageMagick ImageMagick-devel \
  openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel \
  mariadb mariadb-server mariadb-devel mariadb-libs
RUN yum -y update && yum install -y \
  gcc gcc-c++ bzip2 make autoconf

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.2
RUN yum -y update && yum -y install ruby && yum clean all \
  && mkdir -p /usr/src/ruby \
  && curl -SL "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2" \
    | tar -xjC /usr/src/ruby --strip-components=1 \
  && cd /usr/src/ruby \
  && autoconf \
  && ./configure --disable-install-doc \
  && make -j"$(nproc)" \
  && yum remove -y ruby \
  && make install \
  && rm -r /usr/src/ruby
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
RUN gem install bundler \
  && bundle config --global path "$GEM_HOME" \
  && bundle config --global bin "$GEM_HOME/bin"
ENV BUNDLE_APP_CONFIG $GEM_HOME

RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs

RUN mkdir -p /app
COPY ./Gemfile /app/
COPY ./Gemfile.lock /app/
WORKDIR /app

RUN bundle install -j4

# RUN yum -y remove \
#   gcc gcc-c++ bzip2 make autoconf \
#  && yum -y clean all

CMD ["sh", "/app/docker/app/start.sh"]
