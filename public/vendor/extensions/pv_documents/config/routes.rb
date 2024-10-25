Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_documents do
    resources :pv_documents, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_documents, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_documents, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
