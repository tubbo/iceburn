require 'active_support/concern'

module Iceburn
  # Define "whitelist" controllers that are not affected by the
  # before_filter, prevents having to `skip_before_filter` all the time.
  # Use the `iceburn_whitelist 'controller_name'` macro to whitelist
  # controllers.
  module Whitelist
    extend ActiveSupport::Concern

    module ClassMethods
      cattr_accessor :iceburn_whitelisted_routes

      # Set the whitelist of controllers not affected by Filters.
      def iceburn_whitelist(*routes)
        self.iceburn_whitelisted_routes = routes
      end
    end

    protected
    # Test if this controller is in the pre-defined whitelist controller
    # params.
    def whitelisted?
      controller_whitelisted? || action_whitelisted?
    end

    private
    def controller_whitelisted?
      iceburn_whitelisted_routes.include? params[:controller]
    end

    def action_whitelisted?
      iceburn_whitelisted_routes.any? do |route|
        route =~ /#{params[:controller]}##{params[:action]}/
      end
    end

    def iceburn_whitelisted_routes
      self.class.iceburn_whitelisted_routes || []
    end
  end
end
