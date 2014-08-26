require 'spec_helper'

describe "User Pages" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_signup_page_appearance }
    #it { should have_title('Sign up') }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission with blanks" do
        before { click_button submit }
        it { should have_invalid_signup_with_blanks_message }
      end
    end

    describe "with valid information" do
      let(:user_signup_information) { { name: "Example User", email: "user@example.com", password: "New Password"} }
      before do
        valid_signup_form_completion(user_signup_information)
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after submission with valid information" do
        before { click_button submit }
        it {should have_user_creation_success_message }
      end
    end
  end

end
