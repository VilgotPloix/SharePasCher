class User < ApplicationRecord
  belongs_to :city
  has_many :appointments
  has_many :events, through: :appointments
  after_create :welcome_send

  def welcome_send
  	UserMailer.welcome(self).deliver_now
  end

end
