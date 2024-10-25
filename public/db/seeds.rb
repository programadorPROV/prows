# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed
# Added by Refinery CMS PvBoardDirectors extension
Refinery::PvBoardDirectors::Engine.load_seed

# Added by Refinery CMS PvCategories extension
Refinery::PvCategories::Engine.load_seed

# Added by Refinery CMS PvBulletins extension
Refinery::PvBulletins::Engine.load_seed

# Added by Refinery CMS PvDocuments extension
Refinery::PvDocuments::Engine.load_seed

# Added by Refinery CMS PvFaqs extension
Refinery::PvFaqs::Engine.load_seed

# Added by Refinery CMS PvHomeMainSections extension
Refinery::PvHomeMainSections::Engine.load_seed

# Added by Refinery CMS PvStocks extension
Refinery::PvStocks::Engine.load_seed

main_video = ::Refinery::Setting.find_by(:name => :main_video)
if main_video.blank?
	::Refinery::Setting.find_or_set(:main_video, "pEWdtA7T0ig")
else 
	puts "video setting already exists"
end
# Added by Refinery CMS PvInterestLinks extension
Refinery::PvInterestLinks::Engine.load_seed

# Added by Refinery CMS PvEmissions extension
Refinery::PvEmissions::Engine.load_seed

# Added by Refinery CMS PvDocEmissions extension
Refinery::PvDocEmissions::Engine.load_seed

# Added by Refinery CMS PvServices extension
Refinery::PvServices::Engine.load_seed

# Added by Refinery CMS PvSliderImages extension
Refinery::PvSliderImages::Engine.load_seed
