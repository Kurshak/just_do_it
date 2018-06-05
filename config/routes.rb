Rails.application.routes.draw do
  
    devise_for :users
    resources :boards do
    resources :task_lists, shallow: true do 
    resources :tasks
    end
  end
  get "complit" => "tasks#complit"
  root'static_page#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
