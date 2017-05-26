require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(1000) }
  end

  describe "#small?" do
    let(:small_event) { create :event, capacity: 10 }
    let(:big_event) { create :event, capacity: 100 }

    it "returns true if the capacity is smaller than 20 people" do
      expect(small_event.small?).to eq(true)
      expect(big_event.small?).to eq(false)
    end
  end

  describe ".order_by_price" do
    let!(:cheap_event)     { create :event, price: 10}
    let!(:expensive_event) { create :event, price: 100 }
    let!(:medium_event)    { create :event, price: 50 }

    it "lists the events, cheapest first" do
      expect(Event.order_by_price).to match_array [ cheap_event, medium_event, expensive_event ]
    end
  end

  describe "association with user" do
    let(:user) { create :user }

    it "belongs to a user" do
      event = user.events.new(name: "Picknick")

      expect(event.user).to eq(user)
    end
  end

  describe "association with category" do
    let(:event) { create :event }

    let(:category1) { create :category, name: "Outside", events: [event] }
    let(:category2) { create :category, name: "Informal", events: [event] }
    let(:category3) { create :category, name: "Active", events: [event] }

    it "has categories" do
      expect(event.categories).to include(category1)
      expect(event.categories).to include(category2)
      expect(event.categories).to include(category3)
    end
  end

  describe "association with registration" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has guests" do
      expect(event.guests).to include(guest_user)
    end
  end
end
