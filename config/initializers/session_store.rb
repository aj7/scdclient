# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_scdclient_session',
  :secret      => '0e16e3eff3cf2dbe35e14dd6ec7b87c98c1f73db4dbe5e437390a21967ed71ecf3ff18389639722c75a92e10af8085691bf472d59bc8968dd3c1bc369a64b189'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
