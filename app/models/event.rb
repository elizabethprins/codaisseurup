class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true, on_or_after: -> { Time.now }
  validates :ends_at, presence: true, on_or_after: -> {:starts_at}
end
