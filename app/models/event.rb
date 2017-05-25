class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 1000}

  def small?
    capacity < 20
  end

  def self.order_by_price
    order(:price)
  end

end
