require 'spec_helper'

describe "Comments" do
  subject { page }
  let(:user) { FactoryGirl.create(:user)  }
  let!(:rally) { FactoryGirl.create(:rally) }

  describe "Create a new Comment" do
    before do
      sign_in user
      visit rally_path(rally)
    end
    

    let(:comment)  { "Comment" }
    let(:submit)  { "Save" }

    it { should have_link(comment)  }
    
    describe "with invalid information" do
      before do 
        click_link comment
      end
      
      it "should not create a comment" do
        expect { click_button submit }.not_to change(Comment, :count)
      end

      describe "after submission with blanks" do
        before { click_button submit }
        it { should have_invalid_new_rally_with_blanks_message }

        it { should have_selector("div.alert-box", text: "Please review the problems below:") }
        it { should have_content("can't be blank") }
      end  
    end

    describe "with valid information" do

      describe "submit" do
        let(:valid_comment) { "valid_comment" }
        before do 
          click_link comment
          fill_in "Body", with: valid_comment
        end

        it "should create Comment" do
          expect { click_button submit }.to change(Comment, :count).by(1)
        end

        describe "should redirect to rally show page after submitting the Comment" do
          before { click_button submit } 
          it { should have_rally_show_data(rally) }
        end

        describe "should display the affirmative post" do
          before { click_button submit } 
          it { should have_content(valid_comment) }
        end

        describe "should show the comment's author" do
          let(:last_comment) { Comment.last }
          before { click_button submit }
          it "should show the comment's author " do
            expect(find("#comment-card-#{last_comment.id}").find(".author")).to have_content(last_comment.user.name)
          end
        end
      end
    end
  end

  describe "Edit an comment" do
    let(:edit) { "edit"}
    let(:submit)  { "Save" }
    let(:original_body)  { "Orignal commeent" }
    let(:edited_body)  { "Edited Comment" }
    let!(:comment) { FactoryGirl.create(:comment, body: original_body, rally: rally, user: user) }

    describe "as a valid user" do
      before do
        sign_in user
        visit rally_path(rally)
      end

      it { should have_link(edit) }

      describe "should save changes" do
        before do
          click_link edit
          fill_in "Body", with: edited_body
          click_button submit
        end

        it { should have_rally_show_data(rally) }
        it { should have_content(edited_body) }
      end
    end

    describe "as wrong user" do
      let(:wrong_user) { FactoryGirl.create(:user, name: "wrong_user" ) }
      before do 
        sign_in wrong_user
        visit rally_path(rally)
      end

      it { should_not have_link(edit) }
    end
  end

  describe "Reply to a Comment" do
    let(:reply) { "reply"}
    let(:submit)  { "Save" }
    let!(:root_comment) { FactoryGirl.create(:comment, rally: rally, user: user) }
    
    before do
      sign_in user
      visit rally_path(rally)
      click_link reply
    end

    it { should have_content "Post a Comment" }

    describe "Should create a nested Comment" do
      before do 
        fill_in "Body", with: "Valid reply"
        click_button submit
      end

      it "should create a comment with a parent_id " do
        expect(Comment.last.parent).to eq(root_comment)
      end

      it { should have_rally_show_data(rally) }
      it { should have_content("Valid reply") }

      it "should be nested " do
        expect(find("div.comment##{root_comment.id}")).to have_content('Valid reply')
      end
    end
  end
  
  # describe "voting" do
  #   let!(:argument_post) { FactoryGirl.create(:original_post, content: "Test content", rally: rally, user: user) }

  #   describe "buttons" do
  #     describe "as non signed-in user" do
  #       describe "without votes" do
  #         before do
  #           visit rally_path(rally)
  #         end
  #         it { should have_selector('.argument-post-vote-button.upvote.unclicked') }
  #         it { should have_selector('.argument-post-vote-button.downvote.unclicked') }
  #       end

  #       describe "with votes" do
  #         before do
  #           sign_in user
  #           user.upvote!(argument_post)
  #           click_link 'Sign out' 
  #           visit rally_path(rally)
  #         end
  #         it { should have_selector('.argument-post-vote-button.upvote.unclicked') }
  #         it { should have_selector('.argument-post-vote-button.downvote.unclicked') }
  #       end
  #     end


  #     describe "after signing in" do
  #       before do
  #         sign_in user
  #         visit rally_path(rally)
  #       end

  #       describe "without votes" do
  #         it { should have_selector('.argument-post-vote-button.upvote.unclicked') }
  #         it { should have_selector('.argument-post-vote-button.downvote.unclicked') }
  #         it "should have a 0 score" do
  #           expect(find("#argument-post-card-#{argument_post.id}").find(".argument-post-score")).to have_content(0)
  #         end

  #         describe "Clicking the upvote link" do
  #           it "should increment the rally score" do
  #             find("#argument-post-card-#{argument_post.id}").find(".argument-post-vote-button.upvote.unclicked").find('a').click
  #             expect(find("#argument-post-card-#{argument_post.id}").find(".argument-post-score")).to have_content(1)
  #           end

  #           describe "Twice" do
  #             it "should destroy the vote" do
  #               find("#argument-post-card-#{argument_post.id}").find(".argument-post-vote-button.upvote.unclicked").find('a').click
  #               find("#argument-post-card-#{argument_post.id}").find(".argument-post-vote-button.upvote.clicked").find('a').click
  #               expect(find("#argument-post-card-#{argument_post.id}").find(".argument-post-score")).to have_content(0)
  #             end
  #           end
  #         end

  #         describe "Clicking the downvote link" do
  #           it "should decrement the rally score" do
  #             find("#argument-post-card-#{argument_post.id}").find(".argument-post-vote-button.downvote.unclicked").find('a').click
  #             expect(find("#argument-post-card-#{argument_post.id}").find(".argument-post-score")).to have_content(-1)
  #           end
  #         end
  #       end

  #       describe "after voting" do
  #         before do
  #           user.vote!(argument_post,1)
  #           visit rally_path(rally)
  #         end
  #         it { should have_selector('div.argument-post-score', text: 1) }

  #         it { should have_selector('.argument-post-vote-button.upvote.clicked') }
  #         it { should have_selector('.argument-post-vote-button.downvote.unclicked') }

  #         describe "followed by downvote" do
  #           before do 
  #             user.downvote!(argument_post) 
  #             visit rally_path(rally)
  #           end
  #           it { should have_selector('.argument-post-vote-button.upvote.unclicked') }
  #           it { should have_selector('.argument-post-vote-button.downvote.clicked') }
  #           it { should have_selector('div.argument-post-score', text: -1) }
  #         end
  #       end
  #     end
  #   end
  # end

  # describe "display order" do
  #   let!(:unpopular_positive_argument) { FactoryGirl.create(:original_post, content: "unpopular positive post", rally: rally, user: user) }
  #   let!(:popular_positive_argument) { FactoryGirl.create(:original_post, content: "popular positive post", rally: rally, user: user) }
  #   let!(:unpopular_negative_argument) { FactoryGirl.create(:original_post, position: "negative", content: "unpopular negative post", rally: rally, user: user) }
  #   let!(:popular_negative_argument) { FactoryGirl.create(:original_post, position: "negative", content: "popular negative post", rally: rally, user: user) }
    

  #   before do
  #     sign_in user
  #     user.upvote!(popular_positive_argument)
  #     user.downvote!(unpopular_positive_argument)
  #     user.upvote!(popular_negative_argument)
  #     user.downvote!(unpopular_negative_argument)
  #     visit rally_path(rally)
  #   end

  #   it { should have_content(popular_positive_argument.content) }
  #   it { should have_content(unpopular_positive_argument.content) }
  #   it { should have_content(unpopular_negative_argument.content) }
  #   it { should have_content(popular_negative_argument.content) }

  #   it "should be determined by score" do
  #     expect(page.body.index(popular_positive_argument.content)).to be < page.body.index(unpopular_positive_argument.content)
  #     expect(page.body.index(popular_negative_argument.content)).to be < page.body.index(unpopular_negative_argument.content)
  #   end
  # end
end
