require 'iceburn/filters'
require 'iceburn/routes'
require 'iceburn/whitelist'

module Iceburn
  # Hook into Rails.
  class Railtie < Rails::Railtie
    initializer 'iceburn.controller_filters' do
      ApplicationController.class_eval do
        include Iceburn::Whitelist
        include Iceburn::Filters
      end
    end

    initializer 'iceburn.routes' do
      ActionDispatch::Routing::Mapper.class_eval do
        include Iceburn::Routes
      end
    end
  end
end
