Rails.application.routes.draw do
  resources :ride_offers
  resources :ride_requests

  get 'test' => 'welcome#oasd'

  root 'welcome#index'
end
