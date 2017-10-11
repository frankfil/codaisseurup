require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_letter" do
    context "matching letters" do
      it "returns the profiles that match the initial"
    end

    context "non-matching letters" do
      it "does not return profiles that don't start with the given letter"
    end
  end
end
