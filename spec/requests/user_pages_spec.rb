require 'spec_helper'

describe "User Pages" do
  let(:user) { FactoryGirl.create(:user) }
  let(:incomplete_user) { FactoryGirl.create(:user, state: nil, district: nil) }
  let!(:representative) { FactoryGirl.create(:representative, state: user.state, district: user.district)}
  let!(:senator) { FactoryGirl.create(:senator, state: user.state)}

  
  subject { page }

  describe "profile page" do
    let(:update_district_header) { "Update your congressional district to identify your representative" }
    let(:update_state_header) { "Update your state to identify your sentator(s)" }
    let(:edit_profile_link) { "Edit profile"}
    let(:edit_state_district_link) { "Edit State & District"}

    describe "as user with district, state and linked twitter account, " do
      before { visit user_path(user) }

      it { should have_content(user.name) }
      it { should have_title(user.name) }
      it { should have_content(user.state) }
      it { should have_content("#{user.state}, #{user.district.ordinalize} district ") }

      describe "senator information" do
        it { should have_content(senator.full_name) }
      end

      describe "representative information" do
        it { should have_content(representative.full_name) }
      end

      describe "twitter link" do
        let!(:identity) {FactoryGirl.create(:identity, user: user)}
        before { visit user_path(user) }

        it {should have_content("Linked Twitter account: Yes")}
        it { should have_link("Twitter Profile","https://twitter.com/intent/user?user_id=#{user.identity.uid}") }
      end
    end

    describe "as user without district, state, and linked twitter account, " do
      before { visit user_path(incomplete_user) }

      it { should have_content(incomplete_user.name) }
      it { should have_title(incomplete_user.name) }

      it { should_not have_link("Add state and district information") }

      describe "twitter link" do
        it { should have_content("Linked Twitter account: No") }
        it { should_not have_link("Link Twitter Account") }
      end

      describe "when logged in" do
        before do 
          sign_in incomplete_user
          visit user_path(incomplete_user) 
        end

        it { should have_link("Add state and district information", href: user_update_state_and_district_path(user_id: incomplete_user.id, id: :update_state)) }
        it { should have_link("Link Twitter Account",  href: user_after_signup_path(user_id: incomplete_user.id, id: :add_twitter)) }

        describe "update state and district wizard" do
          before do 
            click_link("Add state and district information") 
          end

          describe "state step" do
            it { should have_content(update_state_header) }
          end

          describe "district step" do
            before do
              find('.select.optional#user_state').find(:xpath, 'option[2]').select_option
              click_button "Next"
            end

            it { should have_content(update_district_header) }
          end

          describe "when completed with valid information" do
            before do 
              find('.select.optional#user_state').find(:xpath, 'option[2]').select_option
              click_button "Next"
              find('.select.optional#user_district').find(:xpath, 'option[2]').select_option
              click_button "Submit"
            end

            it "should update the user's state " do
              expect(incomplete_user.reload.state).not_to be_nil
            end

            it "should update the user's district " do
              expect(incomplete_user.reload.district).not_to be_nil
            end
          end
        end
      end
    end

    describe "as user without district" do
      before do 
        incomplete_user.update(state: "NY")
        visit user_path(incomplete_user)
      end

      it { should_not have_link("Add district information") }

      describe "when logged in" do
        before do
          sign_in incomplete_user
          visit user_path(incomplete_user) 
        end

        it { should have_link("Add district information", href: user_update_state_and_district_path(user_id: incomplete_user.id, id: :update_district)) }

        describe "click Add district information link" do
          before do
            click_link "Add district information"
          end
          it { should have_content(update_district_header) }

          describe "complete with valid information" do
            before do 
              find('.select.optional#user_district').find(:xpath, 'option[2]').select_option
              click_button "Submit"
            end

            it "should update the user's district " do
              expect(incomplete_user.reload.district).not_to be_nil
            end
          end
        end
      end
    end

    describe "as user without state" do
      before do 
        incomplete_user.update(district: 1)
        visit user_path(incomplete_user)
      end

      it { should_not have_link("Add state information") }


      describe "when logged in" do
        before do
          sign_in incomplete_user
          visit user_path(incomplete_user) 
        end

        it { should have_link("Add state information", href: user_update_state_and_district_path(user_id: incomplete_user.id, id: :update_state)) }

        describe "click Add state information link" do
          before do
            click_link "Add state information"
          end
          it { should have_content(update_state_header) }

          describe "complete wizard" do
            before do 
              find('.select.optional#user_state').find(:xpath, 'option[2]').select_option
              click_button "Next"
              find('.select.optional#user_district').find(:xpath, 'option[3]').select_option
              click_button "Submit"
            end

            it "should update the user's state " do
              expect(incomplete_user.reload.state).not_to be_nil
            end

            it "should update the user's district " do
              expect(incomplete_user.reload.district).not_to eq(1)
            end
          end
        end
      end
    end

    describe "when logged out" do 
      it { should_not have_link(edit_profile_link, edit_user_path(user)) }
      it { should_not have_link(edit_state_district_link, href: user_update_state_and_district_path(user_id: user.id, id: :update_state)) }
    end

    describe "when logged in" do
      before do
        sign_in user
        visit user_path(user)
      end
      
      it { should have_link(edit_profile_link, edit_user_path(user)) }
      it { should have_link(edit_state_district_link, href: user_update_state_and_district_path(user_id: user.id, id: :update_state)) }
    end
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

      describe "Enter Add State Form" do
        before { click_button submit }
        it { should have_content("State") }
        
        describe "after valid state selection and submission" do
          let(:sample_user) { User.last }
          before do
            find('.select.optional#user_state').find(:xpath, 'option[2]').select_option
            click_button "Next"
          end

          it "should show district form label" do
            expect(find('.control-label')).to have_content("District")
          end

          it "should update the user's state " do
            expect(sample_user.reload.state).not_to be_nil
          end

          describe "Enter Add Congressional district Form" do

            describe "submit valid information" do
              before do
                find('.select.optional#user_district').find(:xpath, 'option[2]').select_option
                click_button "Next"
              end

              it "should update the user's district" do
                expect(sample_user.reload.district).not_to be_nil
              end

              it { should have_link("Add Twitter", "/auth/twitter") }
            end
            
            describe "Find Congressional District Helper form" do
              it { should have_content("Address") }
              it { should have_content("City") }
              it { should have_content("State") }

              describe "Using helper form with valid information" do
                let(:address) { "1600 Pennsylvania Ave NW" }
                let(:city) { "Washington" }
                let(:state) { "DC" }

                before do
                  fill_in "Address", with: address
                  fill_in "City", with: city
                  fill_in "State", with: state 
                end

                it "should respond with javascript" do
                  xhr :get, find_congressional_district_path, { address: address , city: city , state: state }
                  expect(response).to render_template('find_congressional_district/index', :format => 'js')
                end
              end
            end
          end
        end
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

      #it { should have_selector('div.alert-box.alert') }
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
