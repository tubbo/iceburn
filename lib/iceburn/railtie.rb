module Iceburn
  # Hook into Rails.
  class Railtie < Rails::Railtie
    initializer 'iceburn.add_filters' do
      ActionController::Base.class_eval do
        include Iceburn::Filters
      end
    end

    initializer 'iceburn.add_routes' do
      module ActionDispatch::Routing
        class Mapper
          include Iceburn::Routes
        end
      end
    end
  end
end
