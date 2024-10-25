module ApplicationHelper

	def menu_presenter
      menu_items = Refinery::Menu.new(Refinery::Page.order(:lft).show_menu)
      presenter = Refinery::Pages::MenuPresenter.new(menu_items, self)
      presenter.dom_id = "menu"
      presenter.css = "inline_divs c_white_all"
      presenter.menu_tag = :div
      presenter
    end
    
    def mobile_presenter
      menu_items = Refinery::Menu.new(Refinery::Page.order(:lft).show_menu)
      presenter = Refinery::Pages::MobileMenuPresenter.new(menu_items, self)
      presenter.dom_id = "container_links"
      presenter.css = "relative"
      presenter.menu_tag = :div
      presenter
    end

end

