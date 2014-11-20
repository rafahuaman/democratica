require 'spec_helper'

describe "CongressMemberFinder" do

  describe "#get_all" do
    let!(:rep) { FactoryGirl.create(:representative, state: "MM", district: 1) }
    let!(:senator) { FactoryGirl.create(:senator, state: "MM") }
    let!(:user) { FactoryGirl.create(:user, state: "MM", district: 1) }
    it "retrieves all of the user's congress members" do
      expect(CongressMemberFinder.get_all(user)).to match_array([senator, rep])
    end
    
  end
end