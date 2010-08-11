#environment.rb  for Rails 3 beta 4

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Scdclient::Application.initialize!

#including erubis helpers
require 'erubis/helpers/rails_helper'
Erubis::Helpers::RailsHelper.engine_class = Erubis::Eruby # or Erubis::FastEruby
#Erubis::Helpers::RailsHelper.init_properties = {}
#Erubis::Helpers::RailsHelper.show_src = nil
Erubis::Helpers::RailsHelper.preprocessing = true

# Be sure to restart your server when you modify this file
