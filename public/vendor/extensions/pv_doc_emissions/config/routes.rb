Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_doc_emissions do
    resources :pv_doc_emissions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pv_doc_emissions, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_doc_emissions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
