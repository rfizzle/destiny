module HealthMonitor
  module Providers
    class Mongoid < Base
      def check!
        return true if ::Mongoid.default_client.command(ping: 1).documents.any? {|d| d == {'ok' => 1}}
        raise StandardError, 'Could not connect to MongoDB'
      end
    end
  end
end

HealthMonitor.configure do |config|
  config.no_database
  config.add_custom_provider(HealthMonitor::Providers::Mongoid)
end