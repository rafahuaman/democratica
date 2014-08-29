require 'spec_helper'

describe "Congress Member Pages" do
  let(:rep) { FactoryGirl.create(:representative) }
  let(:senator) { FactoryGirl.create(:senator) }
  let(:admin) { FactoryGirl.create(:admin) }
  
  subject { page }

  describe "profile page" do
    
    before { visit congress_member_path(rep) }

    it { should have_content(rep.full_name) }
    it { should have_title(rep.full_name) }
    it { should have_content(rep.state) }
    it { should have_content(rep.district) }
    it { should have_content(rep.party) }
    it { should have_content(rep.twitter_handle) }
    it { should have_content(rep.type) }
    
  end

  describe "edit" do
    let(:submit) { "Submit" }
    before do
      sign_in admin
      visit edit_congress_member_path(rep)
    end

    describe "page" do
      it { should have_content("Editing congress member") }
      it { should have_title("Edit congress member") }
    end

    describe "with invalid information" do
      before { click_button submit }

      it { should have_selector('div.alert-box.alert') }
    end
    
    describe "with valid information" do
      let(:congress_member_signup_information) { { first_name: "NewName", last_name: "NewSurname", party: "D" } }
      before do 
        valid_edit_congress_member_form_completion(congress_member_signup_information) 
        click_button submit
      end
      
      it { should have_content(congress_member_signup_information[:first_name]) }
      it { should have_content(congress_member_signup_information[:last_name]) }
      it { should have_content(congress_member_signup_information[:party]) }
      it { should have_selector('div.alert-box.success') }
      specify { expect(rep.reload.name).to  eq congress_member_signup_information[:name] }
    end   
  end

  describe "index" do
    before do
      visit congress_members_path
    end

    it { should have_title('All members of congress') }
    it { should have_content('All members of congress') }

    it "should list each user" do
      CongressMember.all.each do |member|
        expect(page).to have_selector('li', text: member.full_name)
      end
    end
    describe "edit & delete links" do

      it { should_not have_link('delete') }
      it { should_not have_link('edit') }

      describe "as an admin user" do
        before do
          sign_in admin
          visit congress_members_path
        end

        it { should have_link('delete', href: congress_member_path(CongressMember.first)) }
        it { should have_link('delete', href: edit_congress_member_path(CongressMember.first)) }
        it "should be able to delete another user" do
          expect do
            click_link('delete', match: :first)
          end.to change(CongressMember, :count).by(-1)
        end
        it { should_not have_link('delete', href: user_path(admin)) }
      end
    end
  end
end
