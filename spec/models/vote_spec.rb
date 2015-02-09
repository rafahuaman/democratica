require 'spec_helper'

describe Vote do
  let(:user) { FactoryGirl.create(:user) }
  let(:rally) { FactoryGirl.create(:rally, user: user) }
  let(:voting_user) { FactoryGirl.create(:user) }
  let(:comment) { FactoryGirl.create(:comment, user: user, rally: rally) }
  
  before do
    @RallyVote = voting_user.votes.build(votable_type: "Rally", votable_id: rally.id, value: 1)
    @CommentVote = voting_user.votes.build(votable_type: "Comment", votable_id: comment.id, value: 1)
  end

  subject { @RallyVote }

  it { should respond_to(:votable_type) }
  it { should respond_to(:votable_id) }
  it { should respond_to(:user) }
  it { should respond_to(:value) }
  its(:user) { should eq voting_user }
  its(:votable) { should eq rally }

  it { should be_valid }

  describe "when user is missing" do 
      before { @RallyVote.user = nil }
      it { should_not be_valid } 
  end

  describe "votable_type" do
    describe "when type is missing" do 
      before { @RallyVote.votable_type = nil }
      it { should_not be_valid } 
    end

    describe "when it is invalid" do    
      before { @RallyVote.votable_type = "Invalid" }
      it { should_not be_valid } 
    end
  end
  

  describe "when votable_id is missing" do 
      before { @RallyVote.votable_id = nil }
      it { should_not be_valid } 
  end 

  describe "value" do
    describe "when value is missing" do 
      before { @RallyVote.value = nil }
      it { should_not be_valid } 
    end

    describe "should only have 1 and -1 values" do
      before { @RallyVote.value = 2 }
      it { should_not be_valid } 
    end
  end

  describe "Duplicate" do
    before do
      vote_copy = @RallyVote.dup
      vote_copy.value = -1
      vote_copy.save
    end 
    it { should_not be_valid }
  end
end