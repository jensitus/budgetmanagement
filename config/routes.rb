Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  resources :households do
    resources :expenses
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'households#index'

  post 'expenses/monthlystatementoutput'
  get 'expenses/monthlyinput'

end
