Rails.application.routes.draw do
  resources :stop_times

  resources :trips do
    member do
      get "stops"
    end
  end

  resources :stops

  resources :routes do 
    member do
      get "directions"
    end
    collection do
      get "data"
    end
  end

end
