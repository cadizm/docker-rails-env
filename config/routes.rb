Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors, only: [:index, :update, :destroy]
  resources :books, only: [:index, :update]

  scope '/authors' do
    get 'book_count', controller: :authors
  end
end
