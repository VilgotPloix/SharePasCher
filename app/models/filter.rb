class Filter < ApplicationRecord
  belongs_to :tag
  belongs_to :event
end
