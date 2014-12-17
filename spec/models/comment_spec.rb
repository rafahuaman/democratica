require 'spec_helper'

describe Comment do

  let(:user) { FactoryGirl.create(:user, name: "Paul")  }
  #let(:chamber) { FactoryGirl.create(:chamber)  }
  let(:rally) { FactoryGirl.create(:rally)  }
  
  before do
    @comment = user.comments.build(body: "Lorem Ipsum", rally: rally)
  end
  
  subject { @comment }
  
  it { should respond_to :body }
  it { should respond_to :user }
  it { should respond_to :rally }
  it { should respond_to :children }
  it { should respond_to :parent }
  it { should respond_to :votes }
  its(:user) { should eq user }
  its(:rally) { should eq rally }
  its(:vote_type) { should eq "Comment" }
  
  it { should be_valid }
  
  describe "when user is missing" do 
    before { @comment.user = nil }
    it { should_not be_valid } 
  end
  
  describe "when rally is missing" do 
    before { @comment.rally = nil }
    it { should_not be_valid } 
  end
  
  
  describe "body" do
    describe "when it is missing" do 
      before { @comment.body = nil }
      it { should_not be_valid } 
    end
    
    describe "when it is blank" do 
      before { @comment.body = " " }
      it { should_not be_valid } 
    end
    
    describe "when it is too long" do
      before { @comment.body = "a"*5001 }
      it { should_not be_valid }
    end
  end  

  describe "Parent" do
    describe "when it is missing" do
      it { should be_valid }
    end

    describe "when it is present" do
      let(:parent_post) { FactoryGirl.create(:comment)  }
      before { @comment.parent = parent_post }
      it { should be_valid }
    end
  end  

end
