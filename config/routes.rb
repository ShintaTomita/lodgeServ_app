Rails.application.routes.draw do
  get '' => "top#index"
  get 'search' => 'rooms#search'
  get 'rooms' => 'rooms#search'
  resources "books"
  resources "rooms"

  get 'login' => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get 'profile/:id' => "profile#show"
  delete "profile/:id"=> "profile#destroy"

  resources "users"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
