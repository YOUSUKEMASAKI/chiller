Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 
  resources :users, only:[:show]
  get 'favorites/tweets' =>'tweets#favorites'
  resources :tweets do
    resources :likes , only: [:create, :destroy]
  end
  root 'hello#link'

  get 'hello/index' => 'hello#index'
  get 'hello/link'  => 'hello#link'
end
