Rails.application.routes.draw do

  root 'static_pages#top'
  get '/signup', to: 'users#new'

 # ログイン機能
 get    '/login', to: 'sessions#new'
 post   '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get  'attendances/edit_one_month' #この行が追加2021/01/20
      patch 'attendances/update_one_month'#この行をさらに追加2021/1/20
    end
    resources :attendances, only: :update #この行を追加2021/1/16
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
