Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_bulletins do
    resources :pv_bulletins, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_bulletins, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_bulletins, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
