Rails.application.routes.draw do
  root "task_groups#index"
  resources :task_groups, only: [:index]
end
