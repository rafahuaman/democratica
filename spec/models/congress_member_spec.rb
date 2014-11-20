require 'spec_helper'

describe CongressMember do
  describe "class methods" do
    it "should return types" do
      expect(CongressMember.types).to match_array(["Representative","Senator"])
    end
  end

  describe "instance" do
    before do
      @rep = CongressMember.new(first_name: "first", last_name: "last", state: "DC", district: 1, party: "R", twitter_handle: "@handle", type_by_house: "Representative")
    end
      
    subject { @rep }

    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:state) }
    it { should respond_to(:district) }
    it { should respond_to(:party) }
    it { should respond_to(:twitter_handle) }
    it { should respond_to(:type_by_house) }

    its(:full_name) { should eq "#{@rep.first_name} #{@rep.last_name}" }
    its(:name_with_title) { should eq "#{@rep.type_by_house} #{@rep.first_name} #{@rep.last_name}" }
    it { should be_representative }
    
    it { should be_valid }
    
    describe "when name is not present" do
      before { @rep.first_name = " " }
      it { should_not be_valid }
    end

    describe "when last name is not present" do
      before { @rep.last_name = " " }
      it { should_not be_valid }
    end

    describe "when type_by_house is not present" do
      before { @rep.type_by_house = " " }
      it { should_not be_valid }
    end

    describe "when type_by_house is senator" do
      before { @rep.type_by_house = "Senator" }
      it { should be_valid }
      it { should be_senator }
    end

    describe "when type_by_house is not valid" do
      before { @rep.type_by_house = "congressperson" }
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
end
