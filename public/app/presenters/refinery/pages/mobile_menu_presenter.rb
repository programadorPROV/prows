require 'active_support/core_ext/string'
require 'active_support/configurable'
require 'action_view/helpers/tag_helper'
require 'action_view/helpers/url_helper'

module Refinery
  module Pages
    class MobileMenuPresenter
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
      self.max_depth = 1
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

      def render_menu_items(menu_items, child_eval=false, clase=nil)
        if menu_items.present?
          buffer_inicial = ActiveSupport::SafeBuffer.new
          buffer_grupo = ActiveSupport::SafeBuffer.new
          buffer_grupo << if child_eval
            size = menu_items.clone.length
            menu_items.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
              buffer << render_menu_item(item, index, child_eval)
              buffer << if index >= (size)
                render_menu_item(item, index, child_eval)
              end
            end
          else
            menu_items.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
              buffer << render_menu_item(item, index, child_eval)
            end
          end            
          buffer_grupo
        end
      end

      def render_menu_item(menu_item, index, child_eval)
        #content_tag(list_item_tag, :class => menu_item_css(menu_item, index)) do
        final_buffer = ActiveSupport::SafeBuffer.new
        children = menu_item_children(menu_item)
        if child_eval
            final_buffer << link_to(menu_item.title, context.refinery.url_for(menu_item.url))
        else  
          buffer = ActiveSupport::SafeBuffer.new
          content_tag(list_item_tag) do
            buffer << if menu_item.has_children? && menu_item.url != "/contact"
              content_tag(:div, :class => "c_gray_pro_1 pad_15 fs_2 bolder", :onclick=>"javascript:unhide('sub_#{menu_item.original_id}')") do
                menu_item.title
              end
            else
              content_tag(:div, :class => "c_gray_pro_1 pad_15 fs_2 bolder", :onclick=>"javascript:unhide('sub_#{menu_item.original_id}')") do
                link_to(menu_item.title, menu_item.url, :style=>"color: black;")
              end
            end
            if children.present?
              buffer << content_tag(:div, :class=> "unselected c_gray_pro_2_all submenu_mobile", :id=> "sub_#{menu_item.original_id}") do
                content_tag(:div, :class => "block_divs pad_1_divs pad_tb_1 bolder fs_13") do
                  render_menu_items(children, true, menu_item.original_id)
                end
              end
            end
            final_buffer << buffer
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