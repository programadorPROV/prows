Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_categories do
    resources :pv_categories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_categories, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_categories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
