require 'spec_helper'

describe TweetsController do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user, no_capybara: true }
  #need to add a sign in with twitter method

  # describe "GET 'new'" do
  #   it "returns http success" do
  #     get 'new'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'create'" do
  #   it "returns http success" do
  #     get 'create', tweet: { message: "message" }
  #     response.should be_success
  #   end
  # end

end
