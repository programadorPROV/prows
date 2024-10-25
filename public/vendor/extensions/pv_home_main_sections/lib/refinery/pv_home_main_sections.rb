require 'refinerycms-core'

module Refinery
  autoload :PvHomeMainSectionsGenerator, 'generators/refinery/pv_home_main_sections_generator'

  module PvHomeMainSections
    require 'refinery/pv_home_main_sections/engine'

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
