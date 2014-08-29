require 'spec_helper'

describe CongressMember do
   before do
    @member = CongressMember.new(first_name: "first", last_name: "last", state: "DC", district: 1, party: "R", twitter_handle: "@handle")
  end
    
  subject { @member }
  
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:state) }
  it { should respond_to(:district) }
  it { should respond_to(:party) }
  it { should respond_to(:twitter_handle) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @member.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @member.last_name = " " }
    it { should_not be_valid }
  end
  
  describe "when state district combination is already taken" do
    before do
      rep_with_same_district = @member.dup
      rep_with_same_district.save
    end 
    it { should_not be_valid }
  end 
end
