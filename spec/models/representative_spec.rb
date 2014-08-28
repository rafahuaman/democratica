require 'spec_helper'

describe Representative do
   before do
    @rep = Representative.new(prefix: "The Honorable", first_name: "first", middle_name:  "M",
                      last_name: "last", suffix: "Jr.", address: "123 street avenue", city: "city",
                      state: "DC", zip4:"20515-0104",  district:"AL01", party: "R", twitter_handle: "@handle")
  end
    
  subject { @rep }
  
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
    before { @rep.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @rep.last_name = " " }
    it { should_not be_valid }
  end

  describe "when district is not present" do
    before { @rep.district = " " }
    it { should_not be_valid }
  end

  describe "when district is too long" do
    before { @rep.district = "AL001" }
    it { should_not be_valid }
  end

  describe "when state is too long" do
    before { @rep.state = "DCI" }
    it { should_not be_valid }
  end
  
  describe "when district is already taken" do
    before do
      rep_with_same_district = @rep.dup
      rep_with_same_district.district =  @rep.district.downcase
      rep_with_same_district.save
    end 
    it { should_not be_valid }
  end 
end
