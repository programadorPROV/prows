require 'refinerycms-core'

module Refinery
  autoload :PvSliderImagesGenerator, 'generators/refinery/pv_slider_images_generator'

  module PvSliderImages
    require 'refinery/pv_slider_images/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
