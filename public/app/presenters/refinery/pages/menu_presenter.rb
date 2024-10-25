require 'active_support/core_ext/string'
require 'active_support/configurable'
require 'action_view/helpers/tag_helper'
require 'action_view/helpers/url_helper'

module Refinery
  module Pages
    class MenuPresenter
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::UrlHelper
      include ActiveSupport::Configurable

      config_accessor :roots, :menu_tag, :list_tag, :list_item_tag, :css, :dom_id,
                      :max_depth, :selected_css, :first_css, :last_css
      self.dom_id = 'menu'
      self.css = 'menu clearfix'
      self.menu_tag = :div
      self.list_tag = :div
      self.list_item_tag = :div
      self.selected_css = :selected
      self.first_css = :first
      self.last_css = :last
      def roots
        config.roots.presence || collection.roots
      end

      attr_accessor :context, :collection
      delegate :output_buffer, :output_buffer=, :to => :context

      def initialize(collection, context)
        @collection = collection
        @context = context
      end

      def to_html

        render_menu(roots) if roots.present?
      end

      private
      def render_menu(items)
        content_tag(menu_tag, :id => dom_id, :class => css) do
          render_menu_items(items)
        end
      end

      def render_menu_items(menu_items, child_eval=false)
        if menu_items.present?
          buffer_inicial = ActiveSupport::SafeBuffer.new
          buffer_grupo = ActiveSupport::SafeBuffer.new
          menu_items.each_slice(5) do |group|
            buffer_grupo << if child_eval
              #content_tag(:div) do
                group.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
                  buffer_child = ActiveSupport::SafeBuffer.new
                  children = menu_item_children(item)
                  if children.present?
                    buffer << content_tag(:div, :class => :sub_nivel) do
                        buffer_child << content_tag(:span) do
                          item.title
                        end
                        buffer_child << content_tag(:div, :class => :nivel_5) do
                          content_tag(:div) do
                            children.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (child_item, index)|
                              buffer<<link_to(child_item.title,  context.refinery.url_for(child_item.url))
                            end
                          end
                        end
                    end
                  else
                    buffer << render_menu_item(item, index, child_eval)
                  end
                end
              #end
            else
              group.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
                buffer << render_menu_item(item, index, child_eval)
              end
            end            
          end
          buffer_inicial << if child_eval
            #content_tag(:div) do 
              buffer_grupo
            #end
          else
            buffer_grupo
          end
        end
      end

      def render_menu_item(menu_item, index, child_eval)
        #content_tag(list_item_tag, :class => menu_item_css(menu_item, index)) do
        final_buffer = ActiveSupport::SafeBuffer.new
        if child_eval
          final_buffer << link_to(menu_item.title, context.refinery.url_for(menu_item.url))
        else  
          buffer = ActiveSupport::SafeBuffer.new
          children = menu_item_children(menu_item)
          content_tag(list_item_tag) do
            #buffer << content_tag(:div, :class => menu_item_css(menu_item, index, children)) do
              buffer << link_to(menu_item.title, context.refinery.url_for(menu_item.url), class: "pad_lr_2 pad_tb_1 relative z1 link_menu bck_gray9 trans_03")
            #end
            if children.present?
              clase = "absolute top_100p submenu fs_11 left_0 bck_gray8 pad_1_divs min_w_15 block_divs"
              children.each do |child|
                if menu_item_children(child).present?
                  clase = "submenu_web tomuch_links"
                end
              end
              buffer << content_tag(:div, :class => clase) do
                  render_menu_items(children, true)
              end
            end
            final_buffer << content_tag(:div, :class=>"relative") do
              buffer
            end
          end
        end
        final_buffer
      end

      # Determines whether any item underneath the supplied item is the current item according to rails.
      # Just calls selected_item? for each descendant of the supplied item
      # unless it first quickly determines that there are no descendants.
      def descendant_item_selected?(item)
        item.has_children? && item.descendants.any?(&method(:selected_item?))
      end

      def selected_item_or_descendant_item_selected?(item)
        selected_item?(item) || descendant_item_selected?(item)
      end

      # Determine whether the supplied item is the currently open item according to Refinery.
      def selected_item?(item)
        path = context.request.path
        path = path.force_encoding('utf-8') if path.respond_to?(:force_encoding)

        # Ensure we match the path without the locale, if present.
        if %r{^/#{::I18n.locale}/} === path
          path = path.split(%r{^/#{::I18n.locale}}).last.presence || "/"
        end

        # First try to match against a "menu match" value, if available.
        return true if item.try(:menu_match).present? && path =~ Regexp.new(item.menu_match)

        # Find the first url that is a string.
        url = [item.url]
        url << ['', item.url[:path]].compact.flatten.join('/') if item.url.respond_to?(:keys)
        url = url.last.match(%r{^/#{::I18n.locale.to_s}(/.*)}) ? $1 : url.detect{|u| u.is_a?(String)}

        # Now use all possible vectors to try to find a valid match
        [path, URI.decode(path)].include?(url) || path == "/#{item.original_id}"
      end

      def menu_item_css(menu_item, index, children)
        css = []
        menu_class = children.present? ? "caption_menu" : "caption_menu noarrow"
        css << menu_class
        css << selected_css if selected_item_or_descendant_item_selected?(menu_item)
        css << first_css if index == 0
        css << last_css if index == menu_item.shown_siblings.length

        css.reject(&:blank?).presence
      end

      def menu_item_children(menu_item)
        within_max_depth?(menu_item) ? menu_item.children : []
      end

      def within_max_depth?(menu_item)
        !max_depth || menu_item.depth < max_depth
      end

    end
  end
end
