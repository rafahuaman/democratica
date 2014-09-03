require 'spec_helper'

describe "Authentication" do
  let(:user) { FactoryGirl.create(:user) }
  
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe "sign in" do
    before { visit signin_path }
    
    let(:submit) { "Sign in" }
    
    describe "with invalid email and password" do
      before { click_button submit }
      it { should have_selector('div.alert-box.alert') }
      
      describe "after visiting another page" do
        before { click_link "Home" }
        
        it { should_not have_selector('div.alert-box.alert') }
      end
    end
    
    describe "with valid email and password" do
      
      before { sign_in user }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path)}
      
      describe "followed by sign out" do
        before { click_link 'Sign out' }
        
        it { should have_link('Sign in') }
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting a protected page" do
          before { visit edit_user_path(user) }
          it { should have_title('Sign in') }

          describe "after signing-in should redirect to previous protected page" do
            before do 
              valid_signin_form_completion(user)
              click_button "Sign in"
            end
            it { should have_title("Edit user") }

            describe "when signing in again" do
              before do
                click_link "Sign out"
                visit signin_path
                fill_in "Email",    with: user.email
                fill_in "Password", with: user.password
                click_button "Sign in"
              end

              it "should render the default (root) page" do
                expect(page).to have_title("Home")
              end
            end
          end
        end

        describe "submitting to the update action" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end

      describe "in the CongressMembers controller" do
        let(:member) { FactoryGirl.create(:congress_member) }

        describe "visiting the new page" do
          before { visit new_congress_member_path }
          it { should have_title('Sign in') }
        end

        describe "visiting the edit page" do
          before { visit edit_congress_member_path(member) }
          it { should have_title('Sign in') }
        end

        describe "submitting to the update action" do
          before { patch congress_member_path(member) }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "submitting to the create action" do
          before { post congress_members_path }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "submitting to the destroy action" do
          before { delete congress_member_path(member) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end

      describe "in the Rally controller" do
        let(:rally) { FactoryGirl.create(:rally) }

        describe "visiting the new page" do
          before { visit new_rally_path }
          it { should have_title('Sign in') }
        end

        describe "visiting the edit page" do
          before { visit edit_rally_path(rally) }
          it { should have_title('Sign in') }
        end

        describe "submitting to the update action" do
          before { patch rally_path(rally) }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "submitting to the create action" do
          before { post rallies_path }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "submitting to the destroy action" do
          before { delete rally_path(rally) }
          specify { expect(response).to redirect_to(signin_path) }
        end

      end
    end

    describe "as wrong user" do
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      
      describe "in the Users controller" do
        
        before { sign_in user, no_capybara: true }

        describe "submitting a GET request to the Users#edit action" do
          before { get edit_user_path(wrong_user) }
          specify { expect(response.body).not_to match('Edit user') }
          specify { expect(response).to redirect_to(root_url) }
        end

        describe "submitting a PATCH request to the Users#update action" do
          before { patch user_path(wrong_user) }
          specify { expect(response).to redirect_to(root_url) }
        end
      end

      describe "in the Rallies controller" do
        let(:rally) { FactoryGirl.create(:rally) }
        before { sign_in user, no_capybara: true }

        describe "submitting a GET request to the #edit action" do
          before { get edit_rally_path(rally) }
          it { should respond_by_redirecting_to_root_page }
        end
        
        describe "submitting a PATCH request to the #update action" do
          before { patch rally_path(rally) }
          it { should respond_by_redirecting_to_root_page }
        end
        
        describe "submitting a DELETE request to the #delete action" do
          before { delete rally_path(rally) }
          it { should respond_by_redirecting_to_root_page }
        end
      end
    end

    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin, no_capybara: true }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { expect(response).to redirect_to(root_url) }
      end

      describe "in the CongressMembers controller" do
        let(:member) { FactoryGirl.create(:congress_member) }

        describe "visiting a protected page" do
          before do 
            sign_in non_admin
            visit edit_congress_member_path(member) 
          end
          it { should have_title('Home') }
        end

        describe "submitting a post request to the congress_members#show action" do
          before { post congress_members_path }
          specify { expect(response).to redirect_to(root_url) }
        end

        describe "submitting a GET request to the congress_members#edit action" do
          before { get edit_congress_member_path(member) }
          specify { expect(response.body).not_to match('Edit congress_member') }
          specify { expect(response).to redirect_to(root_url) }
        end

        describe "submitting a PATCH request to the congress_members#update action" do
          before { patch congress_member_path(member) }
          specify { expect(response).to redirect_to(root_url) }
        end

        describe "submitting a DELETE request to the congress_members#destroy action" do
          
          before { delete congress_member_path(user) }
          specify { expect(response).to redirect_to(root_url) }
        end
      end
    end
  end
end
