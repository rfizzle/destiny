FROM ruby:2.4.0

# Install dependencies
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update -qq && \
    apt-get install -qq -y build-essential nodejs && \
    npm install yarn -g

# Setup destiny directory
RUN mkdir /destiny
WORKDIR /destiny
ADD Gemfile /destiny/Gemfile
ADD Gemfile.lock /destiny/Gemfile.lock
RUN bundle install
ADD . /destiny

# Precompile Assets
RUN RAILS_ENV=production /destiny/bin/rails assets:precompile

# Expose port 3000 and run rails server
EXPOSE 3000
CMD ["/destiny/bin/rails", "server"]