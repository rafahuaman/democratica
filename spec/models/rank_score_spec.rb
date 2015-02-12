require 'spec_helper'

describe RankScore do
  let(:user) { FactoryGirl.create(:user) }
  let(:rally) { FactoryGirl.create(:rally, user: user) }
  let(:comment) { FactoryGirl.create(:comment, user: user, rally: rally) }
  
  before do
    @RallyRank = rally.rank_score
  end

  subject { @RallyRank }

  it { should respond_to(:rankable_type) }
  its(:rankable_type) { should eq "Rally" }
  it { should respond_to(:rankable_id) }
  it { should respond_to(:value) }
  its(:rankable) { should eq rally }

  it { should be_valid }

  describe "rankable_type" do

    describe "when type is missing" do 
      before { @RallyRank.rankable_type = nil }
      it { should_not be_valid } 
    end

    describe "when it is invalid" do    
      before { @RallyRank.rankable_type = "Invalid" }
      it { should_not be_valid } 
    end
  end
  

  describe "when rankable_id is missing" do 
      before { @RallyRank.rankable_id = nil }
      it { should_not be_valid } 
  end 

  describe "value" do
    describe "when value is missing" do 
      before { @RallyRank.value = nil }
      it { should_not be_valid } 
    end
  end

  describe "Duplicate" do
    let(:rank_score_copy) { @RallyRank.dup }

    it "should not be valud" do
      expect(rank_score_copy).to_not be_valid
    end
  end
end