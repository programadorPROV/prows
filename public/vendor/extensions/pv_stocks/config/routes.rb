Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_stocks do
    resources :pv_stocks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_stocks, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_stocks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
