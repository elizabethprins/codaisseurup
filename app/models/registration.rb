class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :guests_count, presence: true

end
