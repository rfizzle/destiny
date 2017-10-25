FROM ruby:2.4.0

# Install dependencies
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update -qq && \
    apt-get install -qq -y build-essential nodejs && \
    npm install yarn -g

# Setup destiny directory
ENV RAILS_ROOT /var/www/destiny
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY config/puma.rb config/puma.rb

COPY . .

# Precompile Assets
RUN bin/rails assets:precompile

# Execute application
CMD ["bundle", "exec", "puma", "-b", "unix://$RAILS_ROOT/tmp/rails.sock", "--pidfile", "$RAILS_ROOT/tmp/rails.pid"]