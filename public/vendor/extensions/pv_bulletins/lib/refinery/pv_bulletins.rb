require 'refinerycms-core'

module Refinery
  autoload :PvBulletinsGenerator, 'generators/refinery/pv_bulletins_generator'

  module PvBulletins
    require 'refinery/pv_bulletins/engine'

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
