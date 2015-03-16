require 'spec_helper'

describe "CongressMemberFinder" do
  let(:state) { "MM" }
  let(:district) { 1 }
  let!(:rep) { FactoryGirl.create(:representative, state: state, district: district) }
  let!(:senator) { FactoryGirl.create(:senator, state: state) }
  let!(:user) { FactoryGirl.create(:user, state: state, district: district) }

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