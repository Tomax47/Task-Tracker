Rails.application.routes.draw do

  resources :projects do
    resources :tasks 
    delete '/task_delete', to: 'tasks#destroy'
  end


  root 'projects#index'

end
