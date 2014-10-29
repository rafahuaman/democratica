require 'spec_helper'

describe Identity do
  let(:user) { FactoryGirl.create(:user)  }
  
  before do
    @identity = user.build_identity(provider: "twitter", uid: "123", access_token: "xxx", access_secret: "xxx" )
  end

  subject { @identity }

  it { should respond_to(:provider) }
  it { should respond_to(:uid) }
  it { should respond_to(:user) }
  it { should respond_to(:access_token) }
  it { should respond_to(:access_secret) }
  it { should be_valid }

  describe "when provider is not present" do
    before { @identity.provider = " " }
    it { should_not be_valid }
  end

  describe "when uid is not present" do
    before { @identity.uid = " " }
    it { should_not be_valid }
  end

  describe "when uid is not present" do
    before { @identity.access_token = " " }
    it { should_not be_valid }
  end

  describe "when uid is not present" do
    before { @identity.access_secret = " " }
    it { should_not be_valid }
  end
end
