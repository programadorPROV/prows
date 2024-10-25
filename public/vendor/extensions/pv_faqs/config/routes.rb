Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_faqs do
    resources :pv_faqs, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_faqs, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_faqs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
