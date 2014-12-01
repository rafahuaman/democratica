require 'spec_helper'

describe "CongressMemberFinder" do
  let!(:rep) { FactoryGirl.create(:representative, state: "MM", district: 1) }
  let!(:senator) { FactoryGirl.create(:senator, state: "MM") }
  let!(:user) { FactoryGirl.create(:user, state: "MM", district: 1) }
  describe "#get_all" do
    it "retrieves all of the user's congress members" do
      expect(CongressMemberFinder.get_all(user)[:senator]).to eq(senator)
      expect(CongressMemberFinder.get_all(user)[:representative]).to eq(rep)
    end
  end

  describe "#get_representative" do
    it "retrieves the user's representative" do
      expect(CongressMemberFinder.get_representative(user)).to eq(rep)
    end
  end

  describe "#get_senator" do
    it "retrieves the user's senator" do
      expect(CongressMemberFinder.get_senator(user)).to eq(senator)
    end
  end
end