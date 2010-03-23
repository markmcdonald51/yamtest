# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_yam_test_session',
  :secret      => '792124a8abb32f2d4989e7e27fde26ff0faf6d3c4287802a7eabac48fe6943b085d87975bf0429819d480922e898b2377666a21ba3c4e29d3e454af03c79e482'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
