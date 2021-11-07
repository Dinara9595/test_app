Rails.application.routes.draw do
  resources :urls do
    member do
      get :stats
    end
  end
end
