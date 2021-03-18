class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :city
  has_many :appointments
  has_many :events, through: :appointments
  after_create :welcome_send

  def welcome_send
  	UserMailer.welcome(self).deliver_now
  end
  has_many :created_events, foreign_key: "host_id", class_name: "Event"

end
