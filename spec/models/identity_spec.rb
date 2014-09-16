require 'spec_helper'

describe Identity do
  let(:user) { FactoryGirl.create(:user)  }
  
  before do
    @identity = user.build_identity(provider: "twitter", uid: "123" )
  end

  subject { @identity }

  it { should respond_to(:provider) }
  it { should respond_to(:uid) }
  it { should respond_to(:user) }
  it { should be_valid }

  describe "when provider is not present" do
    before { @identity.provider = " " }
    it { should_not be_valid }
  end

  describe "when uid is not present" do
    before { @identity.uid = " " }
    it { should_not be_valid }
  end
end
