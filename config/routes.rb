Rails.application.routes.draw do
  root "task_groups#index"
  resources :task_groups, only: [:index] do
    collection do
      post :update_variables
    end
  end
end
