# The before_filter used to handle HTML requests that aren't caught by
# the main application routes. Can also be used in conjunction with
# Iceburn::Whitelist.

module Iceburn
  module Filters
    extend ActiveSupport::Concern

    included do
      before_action :handle_html_requests
    end

    # Return blank on all requests to the root path.
    def index
      handle_html_requests
    end

    protected
    def handle_html_requests
      render text: '', layout: 'application' and return unless skip?
    end

    private
    def skip?
      json_request? || xhr_request? || whitelisted?
    end

    def json_request?
      "#{params[:format]}" == 'json'
    end

    def xhr_request?
      request.xhr?
    end
  end
end
