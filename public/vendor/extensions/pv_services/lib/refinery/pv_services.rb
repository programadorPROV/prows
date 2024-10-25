require 'refinerycms-core'

module Refinery
  autoload :PvServicesGenerator, 'generators/refinery/pv_services_generator'

  module PvServices
    require 'refinery/pv_services/engine'

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
