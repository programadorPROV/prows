Refinery::PagesController.class_eval do
	before_action :load_video
	#skip_before_action :find_page, :if => :custom_action
	
	def load_video
		@main_video = ::Refinery::Setting.find_by(:name => :main_video)
	end

	def junta_directiva
	    @pv_board_directors = ::Refinery::PvBoardDirectors::PvBoardDirector.where(:director_type => :jun_dir).order('position ASC')
		render_with_templates?
	end

	def empresa
		render_with_templates?
	end

	def herramientas
		render_with_templates?
	end

	def bolsa
		render_with_templates?
	end

	def principales_ejecutivos
	    @pv_board_directors = ::Refinery::PvBoardDirectors::PvBoardDirector.where(:director_type => :prin_eje).order('position ASC')
		render_with_templates?
	end

	def custom_action
		@page.blank? || ["junta_directiva","principales_ejecutivos"].include?(action_name) ? false : true
	end

  	protected

	def find_page
		@page = ::Refinery::Page.find_by(:link_url => '/bolsa') || error_404 if action_name == 'bolsa'
		@page = ::Refinery::Page.find_by(:link_url => '/empresa') || error_404 if action_name == 'empresa'
		@page = ::Refinery::Page.find_by(:link_url => '/herramientas') || error_404 if action_name == 'herramientas'
		@page = ::Refinery::Page.find_by(:link_url => '/empresa/junta-directiva') || error_404 if action_name == 'junta_directiva'
		@page = ::Refinery::Page.find_by(:link_url => '/empresa/principales-ejecutivos') || error_404 if action_name == 'principales_ejecutivos'
		@page = ::Refinery::Page.find_by(:link_url => '/') || error_404 if action_name == 'home'
		begin
			return @page || ::Refinery::Page.find_by_path_or_id(params[:path], params[:id]) || error_404
		rescue ActiveRecord::RecordNotFound
			return error_404
		end
	end
	#alias_method :find_page, :find_page_with_my_stuff
    #def find_all_blog_posts
    #  @blog_posts = Refinery::BlogPost.live
    #end

end