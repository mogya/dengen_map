# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'mogya+awssanbox1@mogya.com'
  layout 'mailer'
end
