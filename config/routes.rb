Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  namespace :admin do
    resources :jobs do

      member do
        post :publish
        post :hide
      end
      resources :resumes
    end
  end
  resources :jobs do
    resources :resumes
  end
  resources :welcome do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
