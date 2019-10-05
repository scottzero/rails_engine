# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :transactions do
        get "/find", to: "search#show"
    end
    resources :transactions, only: [:index, :show]
  end
end

  namespace :api do
    namespace :v1 do
      namespace :customers do
        get "/find", to: "search#show"
    end
    resources :customers, only: [:index, :show]
  end
end

  namespace :api do
    namespace :v1 do
      namespace :invoice_items do
        get "/find", to: "search#show"
    end
    resources :invoice_items, only: [:index, :show]
  end
end

  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get "/find", to: "search#show"
  end
  resources :invoices, only: [:index, :show]
end
end


  namespace :api do
    namespace :v1 do
      namespace :items do
        get "/find", to: "search#show"
      end
      resources :items, only: [:index, :show]
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        #search endpoints
      get "/find", to: "search#show"
      get "/find_all", to: "search#index"
      get "/random", to: "search#random"
        #relationship endpoints
      get "/:id/items", to: "items#index"
    end
    resources :merchants, only: [:index,:show]
  end
end
end #end routes
