require 'spec_helper'

describe "Rally pages" do

  let(:user) { FactoryGirl.create(:user)  }
  let!(:rally) { FactoryGirl.create(:rally, user: user) }

  subject { page }

  describe "index" do  
    before { visit root_path }
    
    it { should have_title("Home") }

    describe "pagination" do
      before(:all) { 30.times { FactoryGirl.create(:rally) } }
      after(:all) do 
        Rally.delete_all 
        User.delete_all
      end

       it { should have_selector('ul.pagination.pagination') }

       it "should list each rally" do
        Rally.includes(:rank_score).order('rank_scores.value desc').all.paginate(page: 1).each do |rally|
          expect(page).to have_selector('li h5', text: rally.title)
        end
      end
    end 

    describe "order" do
      let(:other_user) { FactoryGirl.create(:user)  }
      let!(:older_rally) { FactoryGirl.create(:rally, title: "Older Rally", user: other_user, created_at: 1.hour.ago) }
      let!(:recent_rally) { FactoryGirl.create(:rally, title: "Recent Rally", user: other_user ) }
      before do
        sign_in user
      end

      describe "by recency" do
        #voting because otherwise the rank is 0.0
        before do
          user.upvote!(older_rally)
          user.upvote!(recent_rally)
          visit root_path
        end

         it "should have recent items first" do
          expect(recent_rally.title).to appear_before(older_rally.title)
        end
      end

      describe "Ranking" do
        before do
          user.upvote!(older_rally)
          visit root_path
        end

        it "should have upvoted items first" do
          expect(older_rally.title).to appear_before(recent_rally.title)
        end
      end
    end
  end

  describe "votes" do
    let(:non_author_user) { FactoryGirl.create(:user, name: "other user")  }
    let(:downvoter) { FactoryGirl.create(:user, name: "downvoter")  }
    before { visit root_path }

    describe "buttons" do

      describe "as non signed-in user" do
        describe "without votes" do
          it { should have_selector('.vote.upvote.unclicked') }
          it { should have_selector('.vote.downvote.unclicked') }
        end

        describe "with votes" do
          before do
            sign_in user
            user.upvote!(rally)
            click_link 'Sign out' 
            visit root_path
          end
          it { should have_selector('.vote.upvote.unclicked') }
          it { should have_selector('.vote.downvote.unclicked') }
        end
      end


      describe "after signing in" do
        before do
          sign_in non_author_user
          visit root_path
        end

        describe "without votes" do
          it { should have_selector('.vote.upvote.unclicked') }
          it { should have_selector('.vote.downvote.unclicked') }
          it "should have a 1 score" do
            expect(find("#rally-card-#{rally.id}").find(".rally-score")).to have_content(1)
          end

          describe "Clicking the upvote link" do
            it "should increment the rally score" do
              find("#rally-card-#{rally.id}").find(".vote.upvote.unclicked").find('a').click
              expect(find("#rally-card-#{rally.id}").find(".rally-score")).to have_content(2)
            end

            describe "Twice" do
              it "should destroy the vote" do
                find("#rally-card-#{rally.id}").find(".vote.upvote.unclicked").find('a').click
                find("#rally-card-#{rally.id}").find(".vote.upvote.clicked").find('a').click
                expect(find("#rally-card-#{rally.id}").find(".rally-score")).to have_content(1)
              end
            end
          end

          describe "Clicking the downvote link" do
            it "should decrement the rally score" do
              find("#rally-card-#{rally.id}").find(".vote.downvote.unclicked").find('a').click
              expect(find("#rally-card-#{rally.id}").find(".rally-score")).to have_content(0)
            end
          end
        end

        describe "after voting" do
          before do
            non_author_user.vote!(rally,1)
            visit root_path
          end
          it { should have_selector('div.rally-score', text: 2) }

          it { should have_selector('.vote.upvote.clicked') }
          it { should have_selector('.vote.downvote.unclicked') }

          describe "followed by downvote" do
            before do 
              non_author_user.downvote!(rally) 
              visit root_path
            end
            it { should have_selector('.vote.upvote.unclicked') }
            it { should have_selector('.vote.downvote.clicked') }
            it { should have_selector('div.rally-score', text: 0) }
          end
        end
      end
    end
  end
  
  describe "create a new rally" do
    before do 
      sign_in user
      visit new_rally_path
    end
    
    let(:submit)  { "Post rally" }
    
    it { should have_new_rally_page_appearance  }
    
    describe "with invalid information" do
      it "should not create a rally" do
        expect { click_button submit }.not_to change(Rally, :count)
      end
       
      describe "after submission with blanks" do
        before { click_button submit }
        it { should have_invalid_new_rally_with_blanks_message }
      end  
    end
    
    describe "with valid information" do
      let(:valid_new_rally_form_data) do
        { title: "title", 
          content: "this is my content", 
          twitter_template: "#template"
        }  
      end
      
      before { valid_rally_form_completion(valid_new_rally_form_data) }
      
      it "should create a rally" do
         expect { click_button submit }.to change(Rally, :count).by(1)
      end

      describe "after creation" do
        before { click_button submit }

        it "should have 1 vote from the user" do
          expect(Rally.last.score).to eq 1
        end

        describe "redirect to rally show page after saving the rally" do
          it { should have_rally_show_data(valid_new_rally_form_data) }
        end
        
        describe "show success message after saving the rally" do
          it { should have_rally_created_successfully_message }
        end
      end
    end
  end
  
  describe "show" do
    before { visit rally_path(rally) }
    
    it { should have_rally_show_data(rally) }
    
    describe "when signed in as rally owner" do
      before do
        sign_in user
        visit rally_path(rally)
      end
      it { should have_rally_links_for_owner(rally) }
    end
    
    describe "when not signed in as rally owner" do
      it { should_not have_rally_links_for_owner(rally) }
    end
  end

  describe "edit page" do
    let(:edit)  { "edit" }
    let(:submit)  { "Save changes" }
    let(:edited_content)  { "Edited Rally Content" }

    before do 
      sign_in user
      visit rally_path(rally)
    end

    it { should have_link(edit) }

    describe "should save changes" do
      before do
        click_link edit
        fill_in "Content", with: edited_content
        click_button submit
      end

      it { should have_content(edited_content) }
    end
  end
end