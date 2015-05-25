require 'spec_helper'

describe "Congress Member Pages" do
  let!(:rep) { FactoryGirl.create(:representative) }
  let(:senator) { FactoryGirl.create(:senator) }
  let(:admin) { FactoryGirl.create(:admin) }
  
  subject { page }

  describe "show page" do
    
    before { visit congress_member_path(rep) }

    it { should have_title(rep.full_name) }
    it { should have_representative_show_data(rep) }
  end

  describe "create a congress member" do
    before do 
      sign_in admin
      visit new_congress_member_path 
    end
    
    let(:submit)  { "Create congress member" }
    
    it { should have_new_congress_member_page_appearance  }
    
    describe "with invalid information" do
      it "should not create a congress member" do
        expect { click_button submit }.not_to change(CongressMember, :count)
      end
       
      # describe "after submission with blanks" do
      #   before { click_button submit }
      #   it { should have_invalid_new_debate_with_blanks_message }
      # end  
    end
    
    describe "with valid information" do
      let(:congress_member_form_information) do { 
        first_name: "NewName", 
        last_name: "NewSurname",
        state: "DC", 
        district: nil, 
        party: "D", 
        twitter_handle: "@NewHandle", 
        type_by_house: "Senator" } 
      end
      
      before { valid_congress_member_form_completion(congress_member_form_information) }
      
      it "should create a congress member" do
         expect { click_button submit }.to change(CongressMember, :count).by(1)
      end
      
      describe "should redirect to congress member show page after saving the congress member" do
        before { click_button submit } 
        it { should have_senator_show_data(congress_member_form_information) }
      end
      
      describe "should show success message after saving the congress member" do
        before { click_button submit }
        it { should have_congress_member_created_successfully_message }
      end
    end
  end

  describe "edit" do
    let(:submit) { "Save changes" }
    before do
      sign_in admin
      visit edit_congress_member_path(rep)
    end

    describe "page" do
      it { should have_content("Edit congress member") }
      it { should have_title("Edit congress member") }
    end

    describe "with invalid information" do
      before do
        fill_in "State", with: ""
       click_button submit 
     end

      it { should have_selector('div.alert-box.alert') }
    end
    
    describe "with valid information" do
      let(:congress_member_form_information) { { first_name: "NewName", last_name: "NewSurname",
                                                state: "DC", district: 2, party: "D", twitter_handle: "@NewHandle", type_by_house: "Senator" } }
      before do 
        valid_congress_member_form_completion(congress_member_form_information) 
        click_button submit
      end
      
      it { should have_content(congress_member_form_information[:first_name]) }
      it { should have_content(congress_member_form_information[:last_name]) }
      it { should have_content(congress_member_form_information[:party]) }
      it { should have_selector('div.alert-box.success') }
      specify { expect(rep.reload.first_name).to  eq congress_member_form_information[:first_name] }
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
          FactoryGirl.create(:representative) 
          FactoryGirl.create(:senator) 
          sign_in admin
          visit congress_members_path
        end

        it { should have_link('delete', href: congress_member_path(CongressMember.first)) }
        it { should have_link('edit', href: edit_congress_member_path(CongressMember.first)) }
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