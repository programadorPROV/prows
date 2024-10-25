Refinery::Core::Engine.routes.draw do
	#match '/junta_directiva', 
	#	:as => :junta_directiva, 
	#	:via => :get,
	#	:controller => "pv_board_directors/pv_board_directors", 
	#	:action => :index
	get '/bolsa', :to => 'pages#bolsa', :as => :bolsa
	get '/empresa', :to => 'pages#empresa', :as => :empresa
	get '/herramientas', :to => 'pages#herramientas', :as => :herramientas
	get '/empresa/junta-directiva', :to => 'pages#junta_directiva', :as => :junta_directiva
	get '/empresa/principales-ejecutivos', :to => 'pages#principales_ejecutivos', :as => :principales_ejecutivos

	get '/emisiones/:id', 
		:controller => "pv_emissions/pv_emissions", 
		:as => :emision, 
		:action => :show

	get '/herramientas/noticias-bursatiles/:id',
		:controller => "pv_bulletins/pv_bulletins",
		:as => :boletine,
		:action => :show

	match '/servicios',
	:as => :servicios,
	:via => :get,
	:controller => "pv_services/pv_services",
	:action => :index

	match '/empresa/informacion-financiera',
	:as => :documentos,
	:via => :get,
	:controller => "pv_documents/pv_documents", 
	:action => :index

	match '/emisiones',
	:as => :emisiones,
	:via => :get,
	:controller => "pv_emissions/pv_emissions",
	:action => :index

	match '/emisiones/doc',
	:as => :doc,
	:via => :get,
	:controller => "pv_doc_emissions/pv_doc_emissions",
	:action => :index

	match '/herramientas/noticias-bursatiles',
	:as => :boletines,
	:via => :get,
	:controller => "pv_bulletins/pv_bulletins", 
	:action => :index

	match '/herramientas/preguntas-frecuentes',
	:as => :preguntas_recuentes,
	:via => :get,
	:controller => 'pv_faqs/pv_faqs',
	:action => :index

	match '/herramientas/enlaces-de-interes',
	:as => :enlaces_de_interes,
	:via => :get,
	:controller => 'pv_interest_links/pv_interest_links',
	:action => :index

	match '/categoria',
	:as => :categoria,
	:via => :get,
	:controller => 'pv_categories/pv_categories',
	:action => :index

end
Rails.application.routes.draw do
	resources :app_requests do
		collection do
			get :change_currency
		end
	end
	get '/resultado-de-busqueda', :to => 'app_requests#search_by_params', :as => :search_by_params_app_requests
	
	# This line mounts Refinery's routes at the root of your application.
	# This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
	# If you would like to change where this extension is mounted, simply change the
	# configuration option `mounted_path` to something different in config/initializers/refinery/core.rb
	#
	# We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"


	mount Refinery::Core::Engine, at: Refinery::Core.mounted_path

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

