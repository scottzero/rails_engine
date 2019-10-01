# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :invoice_items, except: [:new, :edit]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :invoices, except: [:new, :edit]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :items, except: [:new, :edit]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :customers, except: [:new, :edit]
    end
  end

  namespace :api do
    namespace :v1 do
    resources :merchants, except: [:new,:edit]
    end
  end
end
