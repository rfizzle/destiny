class HealthController < ApplicationController
  def index
    # Get statuses
    @statuses = statuses

    respond_to do |format|
      format.html { render }
      format.json { render json: statuses.to_json }
      format.xml { render xml: statuses.to_xml }
    end
  end

  private

  # Initialize status of services
  def statuses
    res = HealthMonitor.check(request: request)
    res.merge(env_vars)
  end

  # Merge in environment variables
  def env_vars
    v = HealthMonitor.configuration.environment_variables || {}
    v.empty? ? {} : { environment_variables: v }
  end
end
