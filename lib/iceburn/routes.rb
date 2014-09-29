module Iceburn
  # Extend your `config/routes.rb` file with these to ensure that the
  # root path is defined and all HTML requests are proxied to Iceburn.
  module Routes
    extend ActiveSupport::Concern

    included do
      get '/*path' => 'application#index'
      root to: 'application#index'
    end
  end
end
