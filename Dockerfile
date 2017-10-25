FROM ruby:2.4.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install YARN
RUN npm install yarn -g

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