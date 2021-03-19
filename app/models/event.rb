class Event < ApplicationRecord
  belongs_to :city
  has_many :appointments
  has_many :filters
  has_many :users, through: :appointments
  has_many :tags, through: :filters
  belongs_to :host, class_name: "User"

  validates :title, presence: true, length: {minimum:2, maximum:50}
  validates :description, presence: true, length: {minimum:10, maximum:500}
  validates :guests_number, numericality: {less_than: 7, greater_than: 0 }
  


  
end
