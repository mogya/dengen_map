class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_registration_email

  def name_str
    email.split('@')[0]
  end

  private

  def send_registration_email
    UserMailer.registration(self).deliver_later unless Rails.env == 'test'
  end
end
