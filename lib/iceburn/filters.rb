require 'iceburn/whitelist'

# The before_filter used to handle HTML requests that aren't caught by
# the main application routes.

module Iceburn
  module Filters
    include Whitelist

    # Return blank on all requests to the root path.
    def index
      handle_html_requests
    end

    protected
    def handle_html_requests
      return if json_request? || whitelisted?
      return if request.xhr?
      render text: '', layout: 'application' and return # block the rest of the chain
    end

    private

    def json_request?
      "#{params[:format]}" == 'json'
    end
  end
end
