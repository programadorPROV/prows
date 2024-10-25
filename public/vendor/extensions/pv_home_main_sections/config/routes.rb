Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_home_main_sections do
    resources :pv_home_main_sections, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_home_main_sections, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_home_main_sections, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
