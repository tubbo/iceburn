Rails.application.routes.draw do
  extend Iceburn::Routes

  namespace :iceburn do
    resources :mocks, only: %w(index)
  end
end
