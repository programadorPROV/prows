module Refinery
  class PvEmissionsGenerator < Rails::Generators::Base

    def rake_db
      rake "refinery_pv_emissions:install:migrations"
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS PvEmissions extension
Refinery::PvEmissions::Engine.load_seed
        EOH
      end
    end
  end
end
