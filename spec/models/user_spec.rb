require 'spec_helper'

describe User do
   before do
    @user = User.new(name: "Example User", email:  "user@example.com")
                      # password: "foobar", password_confirmation: "foobar")
  end
    
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  # it { should respond_to(:password_digest) }
  # it { should respond_to(:password) }
  # it { should respond_to(:password_confirmation) }
  # it { should respond_to(:authenticate) }
  # it { should respond_to(:remember_token) }
  
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is already taken" do
    before do
      user_with_same_name = @user.dup
      user_with_same_name.save
    end 
    it { should_not be_valid }
  end
  
  # describe "when name password is not present" do
  #   before do
  #     @user.password  = " "
  #     @user.password_confirmation  = " " 
  #   end
    
  #   it { should_not be_valid }
  # end
  
  # describe "when password doesn't match confirmation" do
  #   before { @user.password_confirmation = "mismatch" }
  #   it { should_not be_valid }
  # end
  
  # describe "when password is too short" do
  #   before { @user.password = @user.password_confirmation  = "a"*5 }
  #   it { should_not be_valid }
  # end
  
  # describe "return value of authentication method" do
  #   before { @user.save }
  #   let(:retrieved_user) { User.find_by(name: @user.name) }
    
  #   describe "with valid password" do
  #     it { should eq (retrieved_user.authenticate(@user.password)) } 
  #   end
    
  #   describe "with invalid password" do
  #     let(:returned_value_for_invalid_authentication) {retrieved_user.authenticate("invalid")}
      
  #     it { should_not eq (returned_value_for_invalid_authentication) } 
  #     specify { expect(returned_value_for_invalid_authentication).to be_false }
  #   end
    
  # end
  
  # describe "remember token" do
  #   before { @user.save }
  #   its(:remember_token) { should_not be_blank }
  # end
  
  
end
