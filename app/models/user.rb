class User < ApplicationRecord
  belongs_to :city
  has_many :appointments
  has_many :events, through: :appointments
  has_many :created_events, foreign_key: "host_id", class_name: "Event"

end
