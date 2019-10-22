Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors, defaults: {format: :json}
  resources :books, defaults: {format: :json}
end
