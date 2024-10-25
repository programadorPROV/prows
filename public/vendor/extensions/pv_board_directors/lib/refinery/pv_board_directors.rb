require 'refinerycms-core'

module Refinery
  autoload :PvBoardDirectorsGenerator, 'generators/refinery/pv_board_directors_generator'

  module PvBoardDirectors
    require 'refinery/pv_board_directors/engine'

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
