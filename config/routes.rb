Rails.application.routes.draw do

  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :base_points   #拠点情報用ルーティング20210207
  resources :users do
    collection {post :import} #この行追加2021/02/03
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get  'attendances/edit_one_month'      #この行が追加2021/01/20
      patch 'attendances/update_one_month'   #この行をさらに追加2021/1/20
      get 'staff_at_work'                    #この行を2021年2月6日追加
      #勤怠承認
      patch 'attendances/update_month_approval'
      # get 'attendances/log'                  #この行を2021年2月16日追加
      # patch 'attendances/update_log'         #この行を2021年2月18日追加
    end
      resources :attendances, only: [:update]  do  #この行を追加2021/1/16日追加
        member do
          get 'edit_over_worktime'                   #この行を追加2021/2/24日
          patch 'update_over_worktime'              #この行を追加2021/2/24日
          #勤怠ログ
          get 'log'  
          

        end
      end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    
end


