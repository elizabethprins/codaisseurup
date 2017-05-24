require 'rails_helper'

describe "Current user viewing the list of events" do
  before { login_as user }

  let(:user)       { create :user, email: "user@mail.com" }
  let(:otheruser)  { create :user, email: "otheruser@mail.com" }

  let!(:event1) { create :event, name: "event 1", user: user }
  let!(:event2) { create :event, name: "event 2", user: user }
  let!(:event3) { create :event, name: "event 3", user: otheruser }

  it "shows all his events" do
    visit events_url

    expect(page).to have_text("event 1")
    expect(page).to have_text("event 2")
  end

  it "does not show other events" do
    visit events_url

    expect(page).not_to have_text("event 3")
  end

end
