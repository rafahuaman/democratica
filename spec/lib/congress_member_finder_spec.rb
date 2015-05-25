require 'spec_helper'

describe "CongressMemberFinder" do
  describe "with user with complete profile" do 
    let(:state) { "MM" }
    let(:district) { 1 }
    let!(:rep) { FactoryGirl.create(:representative, state: state, district: district) }
    let!(:first_senator) { FactoryGirl.create(:senator, state: state) }
    let!(:second_senator) { FactoryGirl.create(:senator, state: state) }

    let!(:user) { FactoryGirl.create(:user, state: state, district: district) }

    describe "#get_all" do
      it "retrieves all of the user's congress members" do
        expect(CongressMemberFinder.get_all(user)[:senators]).to match_array([first_senator,second_senator])
        expect(CongressMemberFinder.get_all(user)[:representative]).to eq(rep)
      end
    end

    describe "#get_representative" do
      it "retrieves the user's representative" do
        expect(CongressMemberFinder.get_representative(user)).to eq(rep)
      end
    end

    describe "#get_senators" do
      it "retrieves the user's senators" do
        expect(CongressMemberFinder.get_senators(user)).to eq([first_senator, second_senator])
      end
    end
  end

  describe "when the user doesn't have a complete profile " do
    let!(:incomplete_user) { FactoryGirl.create(:user, state: nil, district: nil) }
    it "returns nulls" do
      expect(CongressMemberFinder.get_all(incomplete_user)[:senators]).to  be_nil 
      expect(CongressMemberFinder.get_all(incomplete_user)[:representative]).to be_nil
    end
    
  end
end