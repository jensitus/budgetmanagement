Rails.application.routes.draw do
  


  resources :households do
    resources :expenses
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'households#index'



end
