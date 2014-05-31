module Iceburn
  module Routes
    def iceburn_html!
      get '/*path' => 'application#index'
      put '/*path' => 'application#index'
      post '/*path' => 'application#index'
      delete '/*path' => 'application#index'
      root to: 'application#index'
    end
  end
end
