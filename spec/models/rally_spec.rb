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
end
