ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
ENV['MONGODB_URI'] ||= 'mongodb://127.0.0.1:27017/destiny'

require 'bundler/setup' # Set up gems listed in the Gemfile.
