Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_services do
    resources :pv_services, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_services, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_services, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
