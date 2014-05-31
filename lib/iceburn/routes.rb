module Iceburn
  # Extend your `config/routes.rb` file with these to ensure that the
  # root path is defined and all HTML requests are proxied to Iceburn.
  module Routes
    def iceburn_html!
      get '/*path' => 'application#index'
      #put '/*path' => 'application#index'
      #post '/*path' => 'application#index'
      #delete '/*path' => 'application#index'
      root to: 'application#index'
    end
  end
end
