require 'spec_helper'

describe "TwitterAdapter" do
  #let!(:twitter) { TwitterAdapter.new }  

  describe "sends tweets" do
    twitter = TwitterAdapter.new 
    twitter.tweet("Hello World. This is a test.")
  end
end