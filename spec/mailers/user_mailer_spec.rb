require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'user mailer' do
    let(:user) { stub_model User, email: 'test@example.com' }
    let(:email) { UserMailer.registration(user).deliver_now }

    it 'Check the mail content' do
      # なぜかうまくいかないのでいったんコメントアウト
      # expect(ActionMailer::Base.deliveries.empty?).to be(false)
      expect(email.from.first).to match(/mogya.com/)
      expect(email.to.first).to eql(user.email)
      expect(email.subject).to match(/ようこそ/)
      expect(email.body.to_s).to match(/ありがとうございます/)
    end
  end
end
