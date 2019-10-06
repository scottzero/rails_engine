# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :transactions do
        #search endpoints
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        #relationship endpoints
        get "/:id/invoice", to: "invoices#show"

    end
    resources :transactions, only: [:index, :show]
  end
end

  namespace :api do
    namespace :v1 do
      namespace :customers do
        #search endpoints, still need random
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        #relationship endpoints
        get "/:id/invoices", to: "invoices#index"
        get "/:id/transactions", to: "transactions#index"
        #business logic endpoints
        get ":id/favorite_merchant", to: "favorite_merchant#show"
    end
    resources :customers, only: [:index, :show]
  end
end

  namespace :api do
    namespace :v1 do
      namespace :invoice_items do
        #search endpoints
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        #relationship endpoints
        get "/:id/item", to: "items#show"
        get "/:id/invoice", to: "invoices#show"
    end
    resources :invoice_items, only: [:index, :show]
  end
end

  namespace :api do
    namespace :v1 do
      namespace :invoices do
        #search endpoints
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        #relationship endpoints
        get "/:id/items", to: "items#index"
        get "/:id/customer", to: "customers#show"
        get "/:id/merchant", to: "merchants#show"
        get "/:id/transactions", to: "transactions#index"
        get "/:id/invoice_items", to: "invoice_items#index"

  end
  resources :invoices, only: [:index, :show]
end
end


  namespace :api do
    namespace :v1 do
      namespace :items do
        #search endpoints
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "search#show"
        #relationship endpoints
        get "/:id/merchant", to: "merchants#show"
        get "/:id/invoice_items", to: "invoice_items#index"

        #business endpoints
        get "/most_revenue", to: "most_revenue#index"
        get "/best_day", to: "best_day#show"
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
      get "/random", to: "search#show"
        #relationship endpoints
      get "/:id/items", to: "items#index"
      get "/:id/invoices", to: "invoices#index"
        #business logic endpoints
      get "/most_revenue", to: "most_revenue#index"
      
    end
    resources :merchants, only: [:index,:show]
  end
end
end #end routes
