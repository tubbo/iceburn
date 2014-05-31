require 'active_support/concern'

# The before_filter used to handle HTML requests that aren't caught by
# the main application routes.

module Iceburn
  module Filters
    extend ActiveSupport::Concern

    included { before_filter :handle_html_requests }

    protected
    def handle_html_requests
      return if json_request? || whitelisted?
      return if request.xhr?
      respond_to { |format| format.html { render 'application/index' } }
    end

    private
    def whitelisted?
      params[:controller] =~ /admin|devise/
    end

    def json_request?
      "#{params[:format]}" == 'json'
    end
  end
end
