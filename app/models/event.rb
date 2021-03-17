class Event < ApplicationRecord
  belongs_to :city
  has_many :appointments
  has_many :filters
  has_many :users, through: :appointments
  has_many :tags, through: :filters

  validates :title, presence: true, length: {minimum:2, maximum:50}
  validates :description, presence: true, length: {minimum:10, maximum:500}
  validate :date_not_passed
  validates :guests_number, numericality: {less_than: 7, greater_than: 0 }
  


  def date_not_passed
    if date < Date.today
      errors.add(:date, "cannot be passed")
    end
  end
end
