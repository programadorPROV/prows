require 'refinerycms-core'

module Refinery
  autoload :PvInterestLinksGenerator, 'generators/refinery/pv_interest_links_generator'

  module PvInterestLinks
    require 'refinery/pv_interest_links/engine'

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
