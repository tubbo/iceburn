require 'iceburn/filters'
require 'iceburn/routes'
require 'iceburn/whitelist'

module Iceburn
  # Hook into Rails.
  class Railtie < Rails::Railtie
    # Enable or disable iceburn.
    config.iceburn = true

    initializer 'iceburn.controller_filters' do
      if config.iceburn
        ActionController::Base.class_eval do
          include Iceburn::Whitelist
          include Iceburn::Filters
        end
      end
    end

    initializer 'iceburn.routes' do
      if config.iceburn
        ActionDispatch::Routing::Mapper.class_eval do
          include Iceburn::Routes
        end
      end
    end
  end
end
