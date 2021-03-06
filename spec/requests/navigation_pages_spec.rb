require 'spec_helper'

describe "Navigation Requests Spec" do
  subject { page }

  describe "Navigation should be available" do
    it "should show the navigation on the home page" do
      visit root_path
      should have_link('Home')
      should have_link('About')
      should have_link('Sign up')
    end
  end
  
  describe "Side bar should be available" do
    it "should show the sidebar on all pages" do
      visit root_path
      should have_link('Start a new rally', new_rally_path)
    end
  end
end
