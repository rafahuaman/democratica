require 'spec_helper'

describe "User Pages" do
  let(:user) { FactoryGirl.create(:user) }
  
  subject { page }

  describe "profile page" do
    
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_signup_page_appearance }
    it { should have_title('Sign up') }
  end

  describe "signup wizard" do

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

      describe "Enter Add Congressional District Form" do
        before { click_button submit }
        it { should have_content("State") }
        it { should have_content("District") }
      end
    end
  end

  describe "edit" do
    let(:submit) { "Save changes" }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
    end

    describe "with invalid information" do
      before { click_button submit }

      it { should have_selector('div.alert-box.alert') }
    end
    
    describe "with valid information" do
      let(:user_signup_information) { { name: "New Name", email: "new@email.com", password: "New Password"} }
      before do 
        valid_signup_form_completion(user_signup_information) 
        click_button submit
      end
      
      it { should have_content(user_signup_information[:name]) }
      it { should have_selector('div.alert-box.success') }
      specify { expect(user.reload.name).to  eq user_signup_information[:name] }
    end

    describe "forbidden attributes" do
      let(:params) do
        { user: { admin: true, password: user.password,
                  password_confirmation: user.password } }
      end
      before do
        sign_in user, no_capybara: true
        patch user_path(user), params
      end
      specify { expect(user.reload).not_to be_admin }
    end   
  end

  describe "index" do
    before do
      sign_in FactoryGirl.create(:user)
      FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
      FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
      visit users_path
    end

    it { should have_title('All users') }
    it { should have_content('All users') }

    it "should list each user" do
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end
    describe "delete links" do

      it { should_not have_link('delete') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it { should have_link('delete', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect do
            click_link('delete', match: :first)
          end.to change(User, :count).by(-1)
        end
        it { should_not have_link('delete', href: user_path(admin)) }
      end
    end
  end
end
