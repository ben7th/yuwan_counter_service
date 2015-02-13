Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/rubymyadmin', as: 'rails_admin'
  root 'home#index'

  resources :api do
    collection do
      post :chat_lines
      post :room_status
      get "chat_lines/stat" => "api#chat_lines_stat"
      get "chat_lines/username_chat_stat" => "api#username_chat_stat"
      get 'chat_lines/username_yuwan_stat' => 'api#username_yuwan_stat'
      get 'chat_lines/forbid_stat' => 'api#forbid_stat'
    end
  end


end
