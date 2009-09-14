# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tweetphotos_session',
  :secret      => '4518065e1f284dba15ca266e6dc080b71e8afbe48a154b7b703f9b1bb6b655b12fae9078ab7bb3a74117438f41cb59dc2165a24e074282294fa15ef6a5e5645a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
