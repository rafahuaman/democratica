require 'spec_helper'

describe Rally do
  let(:user) { FactoryGirl.create(:user)  }

  before do
    @rally = user.rallies.build(title: "title", content: "content", twitter_template: "#twitter template")
  end
    
  subject { @rally }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:twitter_template) }
  it { should respond_to(:user) }
  it { should respond_to(:comments) }
  it { should respond_to :votes }
  it { should respond_to :score }
  it { should respond_to(:root_comments) }
  it { should respond_to(:age_in_hours) }
  it { should respond_to(:rank_score) }

  its(:vote_type) { should eq "Rally" }
  
  it { should be_valid }
  
  describe "when title is not present" do
    before { @rally.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long " do
    before { @rally.title = "a"*301 }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @rally.content = " " }
    it { should_not be_valid }
  end

  describe "when content is too long" do
    before { @rally.content = "a"*5001 }
    it { should_not be_valid }
  end

  describe "when twitter_template is not present" do
    before { @rally.twitter_template = " " }
    it { should_not be_valid }
  end

  describe "when twitter_template longer than 140 characters" do
    before { @rally.twitter_template = "a".*141 }
    it { should_not be_valid }
  end

  describe "root comments" do
    let!(:root_comment) { FactoryGirl.create(:comment, rally: @rally)  }
    let!(:reply_comment) { FactoryGirl.create(:child_comment, rally: @rally, parent_id: root_comment.id) }

    its(:root_comments) { should have(1).items }  

  end

  describe "age_in_hours" do
    before do
      @rally.save
    end

    its(:age_in_hours) { should be 0}
    
    describe "modifying it to 2 hours ago"  do
      before do
        @rally.update(created_at:  2.hour.ago)
      end

      its(:age_in_hours) { should be 2}
    end
  end

  describe "rank_score" do
    before do
      @rally.save
    end

    let(:expected_rank_score) { (@rally.score - 1)/(@rally.age_in_hours + 2)**1.8 }
    its(:rank_score) {should eq(expected_rank_score) }
  end
end
