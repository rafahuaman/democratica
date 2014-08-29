require 'spec_helper'

describe CongressMember do
   before do
    @member = CongressMember.new(prefix: "The Honorable", first_name: "first", middle_name:  "M",
                      last_name: "last", suffix: "Jr.", address: "123 street avenue", city: "city",
                      state: "DC", zip4:"20515-0104",  district:"AL01", party: "R", twitter_handle: "@handle")
  end
    
  subject { @member }
  
  it { should respond_to(:prefix) }
  it { should respond_to(:first_name) }
  it { should respond_to(:middle_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:suffix) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip4) }
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

  describe "when district is not present" do
    before { @member.district = " " }
    it { should_not be_valid }
  end

  describe "when district is too long" do
    before { @member.district = "AL001" }
    it { should_not be_valid }
  end

  describe "when state is too long" do
    before { @member.state = "DCI" }
    it { should_not be_valid }
  end
  
  describe "when district is already taken" do
    before do
      rep_with_same_district = @member.dup
      rep_with_same_district.district =  @member.district.downcase
      rep_with_same_district.save
    end 
    it { should_not be_valid }
  end 
end
