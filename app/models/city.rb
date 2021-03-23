class City < ApplicationRecord
  has_many :events

  validates_presence_of :city_name, message: "can't be blank"
end
