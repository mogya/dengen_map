# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.secret_key = 'a1616ff9f026390aa160be8d0438ad2535734d4fecff86125f9c99412c5f234f21e78473550a1085c7c2c8556982935ba06ecf86fb1f65fcb8f028d8d6656374'
  config.mailer_sender = 'mogya+oasis@mogya.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
