require 'spec_helper'

describe VotesController do

  let(:user) { FactoryGirl.create(:user) }
  let!(:rally) { FactoryGirl.create(:rally, user: user) }
  let(:comment) { FactoryGirl.create(rally: rally) }

  before { sign_in user, no_capybara: true }

  describe "creating a Vote with Ajax" do

    it "should increment the Vote count" do
      expect do
        xhr :post, :create, vote: { user: user, votable_type: rally.vote_type, votable_id: rally.id, value: 1 }
      end.to change(Vote, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, vote: { user: user, votable_type: rally.vote_type, votable_id: rally.id, value: 1 }
      expect(response).to be_success
    end
  end

  describe "destroying a Vote with Ajax" do

    before { user.upvote!(rally) }
    let(:vote) do
      user.votes.find_by(votable_id: rally.id, votable_type: rally.vote_type)
    end

    it "should decrement the Relationship count" do
      expect do
        xhr :delete, :destroy, id: vote.id
      end.to change(Vote, :count).by(-1)
    end

    it "should respond with success" do
      xhr :delete, :destroy, id: vote.id
      expect(response).to be_success
    end
  end
end