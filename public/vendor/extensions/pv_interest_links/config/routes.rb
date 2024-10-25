Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_interest_links do
    resources :pv_interest_links, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_interest_links, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_interest_links, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
