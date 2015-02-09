require 'spec_helper'

describe VotesController do

  let(:user) { FactoryGirl.create(:user) }
  let(:non_author_user) { FactoryGirl.create(:user) }
  let!(:rally) { FactoryGirl.create(:rally, user: user) }
  let(:comment) { FactoryGirl.create(rally: rally) }

  before { sign_in non_author_user, no_capybara: true }

  describe "creating a Vote with Ajax" do

    it "should increment the Vote count" do
      expect do
        xhr :post, :create, vote: { user: non_author_user, votable_type: rally.vote_type, votable_id: rally.id, value: 1 }
      end.to change(Vote, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, vote: { user: non_author_user, votable_type: rally.vote_type, votable_id: rally.id, value: 1 }
      expect(response).to be_success
    end
  end

  describe "destroying a Vote with Ajax" do

    before { non_author_user.upvote!(rally) }
    let(:vote) do
      non_author_user.votes.find_by(votable_id: rally.id, votable_type: rally.vote_type)
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