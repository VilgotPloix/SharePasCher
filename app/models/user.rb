class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_many :events, through: :appointments
  after_create :welcome_send

  def welcome_send
  	UserMailer.welcome(self).deliver_now
  end
  has_many :created_events, foreign_key: "host_id", class_name: "Event"

  def is_profile_fully_completed
    if (self.first_name.blank? || self.last_name.blank? || self.birth_day.blank?) == true then return false
    else return true
    end
  end

end
