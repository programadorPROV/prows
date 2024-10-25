Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_slider_images do
    resources :pv_slider_images, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_slider_images, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_slider_images, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
