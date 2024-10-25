Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_emissions do
    resources :pv_emissions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_emissions, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_emissions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
