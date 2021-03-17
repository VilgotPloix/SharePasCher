class Event < ApplicationRecord
  belongs_to :city
  has_many :appointments
  has_many :filters
  has_many :users, through: :appointments
  has_many :tags, through: :filters
end
