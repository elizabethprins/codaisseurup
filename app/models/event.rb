class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user
  has_many :photos

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 1000}

  def small?
    capacity < 20
  end

  def self.order_by_price
    order(:price)
  end

end
