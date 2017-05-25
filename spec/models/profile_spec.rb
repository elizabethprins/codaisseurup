require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_initial" do
    subject { Profile.by_initial("C") } # expect(use either name)

    let(:profile1) { create :profile, first_name: "Elizabeth"}
    let(:profile2) { create :profile, first_name: "Cor" }
    let(:profile3) { create :profile, first_name: "Claudia" }

    it "shows the profiles that start with a C" do
      expect(Profile.by_initial('C')).to match_array [ profile2, profile3 ]
      expect(subject).not_to include profile1
    end
  end
end
