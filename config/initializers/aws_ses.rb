# frozen_string_literal: true

Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.raise_delivery_errors = true
Rails.application.config.action_mailer.smtp_settings = {
  address: ENV['SMTP_ADDRESS'],
  port: 587,
  user_name: ENV['SMTP_USERNAME'],
  password: ENV['SMTP_PASSWORD'],
  authentication: :login
}
