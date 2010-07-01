#environment.rb  for Rails 3 beta 4

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Scdclient::Application.initialize!

# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
#RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
#require File.join(File.dirname(__FILE__), 'boot')
#


#Rails::Initializer.run do |config|

  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # connfig.gem "bj"
  # connfig.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # connfig.gem "sqlite3-ruby", :lib => "sqlite3"
  # connfig.gem "aws-s3", :lib => "aws/s3"

#  connfig.gem 'acts-as-taggable-on'
#  connfig.gem 'authlogic'
#  connfig.gem 'formtastic'
#  connfig.gem 'validation_reflection'
#  connfig.gem 'cancan'
#  connfig.gem 'inherited_resources', :version => '1.0.6'
#  connfig.gem 'acts_as_audited', :lib => false
#  connfig.gem 'awesome_nested_set'
#  connfig.gem 'paper_trail' #for versioning
#  connfig.gem 'jackdempsey-acts_as_commentable', :lib => 'acts_as_commentable', :source => "http://gems.github.com" #for comments
#  connfig.gem 'acts_as_archive' #if some models are being deleted, then archive them just for the sake of doing so
#  connfig.gem 'json'


  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
 # config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
#end
