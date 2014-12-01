require 'spec_helper'

describe "TweetBuilder" do

  describe "#build" do
    let(:rep_handle) { "@rep" }
    let(:senator_handle) { "@senator" }
    let!(:rep) { FactoryGirl.create(:representative, state: "MM", district: 1, twitter_handle: rep_handle) }
    let!(:senator) { FactoryGirl.create(:senator, state: "MM", twitter_handle: senator_handle) }
    let!(:user) { FactoryGirl.create(:user, state: "MM", district: 1) }
    let!(:builder) { TweetBuilder.new(user, "Tweet Text") }
    it "builds a tweet with the users' choice of senator and/or representative" do
      expect(builder.build_for(:senator)).to eq("#{senator_handle} Tweet Text")
      expect(builder.build_for(:representative)).to eq("#{rep_handle} Tweet Text")
      expect(builder.build_for(:all)).to eq("#{senator_handle} #{rep_handle} Tweet Text")
    end
  end
end