# encoding: utf-8
Refinery::Core.configure do |config|
  # When true will rescue all not found errors and display a friendly error page
  config.rescue_not_found = Rails.env.production?

  # When true this will force SSL redirection in all Refinery backend controllers.
  # config.force_ssl = false

  # Set the S3 options using means other than securely by environment variables.
  # If you have to.
  # config.s3_bucket_name = ENV['S3_BUCKET']
  # config.s3_region = ENV['S3_REGION']
  # config.s3_access_key_id = ENV['S3_KEY']
  # config.s3_secret_access_key = ENV['S3_SECRET']

  # When true will use Amazon's Simple Storage Service instead of
  # the default file system for storing resources and images
  config.s3_backend = config.s3_access_key_id.present? || config.s3_secret_access_key.present?

  # Use a custom Dragonfly storage backend instead of the default
  # file system for storing resources and images
  # config.dragonfly_custom_backend_class = nil
  # config.dragonfly_custom_backend_opts = {}

  # Whenever Refinery caches anything and can set a cache key, it will add
  # a prefix to the cache key containing the string you set here.
  # config.base_cache_key = :refinery

  # Site name
  config.site_name = "Provalores"

  # This activates Google Analytics tracking within your website. If this
  # config is left blank or set to UA-xxxxxx-x then no remote calls to
  # Google Analytics are made.
  config.google_analytics_page_code = "UA-114427481-1"

  # Enable/disable authenticity token on frontend
  # config.authenticity_token_on_frontend = false

  # Should set this if concerned about DOS attacks. See
  # http://markevans.github.com/dragonfly/file.Configuration.html#Configuration
  # config.dragonfly_secret = "9df164e5c1e48d3aa492f95dc9b0c4c6fe9e1908b94d2c2e"

  # Register extra javascript for backend
  # config.register_javascript "prototype-rails"

  # Register extra stylesheet for backend (optional options)
  # config.register_stylesheet "custom", :media => 'screen'

  # Specify a different backend path than the default of "refinery".
  # Make sure you clear the `tmp/cache` directory after changing this setting.
  config.backend_route = "pv_admin"

  # Specify a different Refinery::Core::Engine mount path than the default of "/".
  # Make sure you clear the `tmp/cache` directory after changing this setting.
  # config.mounted_path = "/"

  # Specify the order Refinery plugins appear in the admin view.
  # Plugins in the list are placed, as ordered, before any plugins not in the list.
  config.plugin_priority = %w(refinery_pages refinery_images refinery_resources)
end
