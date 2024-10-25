# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w(preloader.css default_min/default.css default_min/origin.css fonts.css 
												material_lm.css s1024.css default_min/s1024_default.css
                                                s1366.css default_min/s1366_default.css s240.css default_min/s240_default.css 
                                                s240_showtime.css s360.css default_min/s360_default.css
                                                s480.css default_min/s480_default.css s700.css default_min/s700_default.css 
                                                s900.css default_min/s900_default.css shd.css default_min/shd_default.css shd_ratio.css swiper.min.css swiper_personalize.css
                                                swiper.min.js getmdl-select.min.js scrolling_info.js layout.js show_hide.js
                                                swiper_personalize.js)
#Rails.application.config.assets.precompile += %w( frontend_application.css frontend_application.js)