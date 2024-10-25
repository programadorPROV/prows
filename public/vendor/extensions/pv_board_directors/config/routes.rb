Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pv_board_directors do
    resources :pv_board_directors, :path => '', :only => [:index]
  end

  # Admin routes
  namespace :pv_board_directors, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pv_board_directors, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
