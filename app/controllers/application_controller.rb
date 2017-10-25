# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include RouteHelpers

  # Set the default run options used in all Trailblazer operations.
  #
  # For now, we initialize request IP and session.
  #
  def _run_options(options)
    options.merge(request_ip: request.ip, session: session, current_user: current_user)
  end

  # Get the current user from the session
  #
  # @return [User,nil] returns a user object if a user is authenticated
  def current_user
    return nil unless session && session[:id]
    {}
  end
end
