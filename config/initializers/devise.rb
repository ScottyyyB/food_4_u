Devise.setup do |config|
  # config.secret_key = 'f9ad2c0740747eb5aaeb79bc211aaef694c54dce48a0c2ef8a33178a09ee6e9f35cd85d17d64668a4c7f7c0fcc47e97dbe43c5360ab246e46d2a3f79726f7354'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
