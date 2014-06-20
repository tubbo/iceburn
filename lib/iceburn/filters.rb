#require 'active_support/concern'

# The before_filter used to handle HTML requests that aren't caught by
# the main application routes.

module Iceburn
  module Filters
    #extend ActiveSupport::Concern
    #included { before_filter :handle_html_requests }

    # Return blank on all requests to the root path.
    def index
      handle_html_requests
    end

    # Define this method to enable controllers that have been
    # whitelisted so users can access their HTML view responses.
    def whitelisted_controllers
      []
    end

    protected
    def handle_html_requests
      return if json_request? || whitelisted?
      return if request.xhr?
      render text: '', layout: 'application' and return # block the rest of the chain
    end

    private
    def whitelisted?
      whitelisted_controllers.include? params[:controller]
    end

    def json_request?
      "#{params[:format]}" == 'json'
    end
  end
end
