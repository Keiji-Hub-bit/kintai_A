Rails.application.routes.draw do

  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    collection {post :import} #この行追加2021/02/03
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get  'attendances/edit_one_month'      #この行が追加2021/01/20
      patch 'attendances/update_one_month'   #この行をさらに追加2021/1/20
      get 'staff_at_work'                    #この行を2021年2月6日追加
      get 'attendances/log'                  #この行を2021年2月16日追加
      patch 'attendances/update_log'         #この行を2021年2月18日追加
      get 'attendances/edit_over_worktime'   #この行を2021年2月22日追加
      patch 'attendances/update_over_worktime'  #この行を2021年2月22日追加
    end
    resources :attendances, only: :update  #この行を追加2021/1/16
      
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    #拠点情報
    resources :base_points do  #拠点情報用ルーティング20210207
    end
end


