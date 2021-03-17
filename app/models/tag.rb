class Tag < ApplicationRecord
  has_many :filters
  has_many :events, through: :filters
end
