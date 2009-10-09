# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails-jquery-sortable_session',
  :secret      => '6825f2e0cc39d928db17e576a6151ccac669e9c58e69e10e25928be57ecc3c901dec7ed773b0ac9f305c9b08e2cead87d6dcef53ddee0b6c6becc8b61af2ea76'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
