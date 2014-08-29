require 'spec_helper'

describe CongressMember do
   before do
    @rep = CongressMember.new(first_name: "first", last_name: "last", state: "DC", district: 1, party: "R", twitter_handle: "@handle", type: "Representative")
  end
    
  subject { @rep }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:state) }
  it { should respond_to(:district) }
  it { should respond_to(:party) }
  it { should respond_to(:twitter_handle) }
  it { should respond_to(:type) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @rep.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @rep.last_name = " " }
    it { should_not be_valid }
  end

  describe "when type is not present" do
    before { @rep.type = " " }
    it { should_not be_valid }
  end

  describe "when type is senator" do
    before { @rep.type = "Senator" }
    it { should be_valid }
  end

  describe "when type is not valid" do
    before { @rep.type = "congressperson" }
    it { should_not be_valid }
  end
  
  describe "when state district combination is already taken" do
    before do
      rep_with_same_district = @rep.dup
      rep_with_same_district.save
    end 
    it { should_not be_valid }
  end 
end
