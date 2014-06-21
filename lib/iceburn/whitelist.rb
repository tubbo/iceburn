require 'active_support/concern'

module Iceburn
  # Define "whitelist" controllers that are not affected by the
  # before_filter, prevents having to `skip_before_filter` all the time.
  # Use the `iceburn_whitelist 'controller_name'` macro to whitelist
  # controllers.
  module Whitelist
    extend ActiveSupport::Concern

    module ClassMethods
      cattr_accessor :iceburn_whitelisted_controllers

      # Set the whitelist of controllers not affected by Filters.
      def iceburn_whitelist(*controllers)
        self.iceburn_whitelisted_controllers = controllers
      end
    end

    protected
    # Test if this controller is in the pre-defined whitelist controller
    # params.
    def whitelisted?
      iceburn_whitelisted_controllers.include? params[:controller]
    end

    def iceburn_whitelisted_controllers
      self.class.iceburn_whitelisted_controllers || []
    end
  end
end
