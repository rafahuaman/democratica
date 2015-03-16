require 'spec_helper'

describe "TweetBuilder" do
  let(:state) { "MM" }
  let(:district) { 1 }
  let(:rep_handle) { "@rep" }
  let(:senator_handle) { "@senator" }

  describe "constants" do
    it "has placeholder constants" do 
      expect(TweetBuilder::SENATOR_PLACEHOLDER).to eq("@YourSenatorHere")
      expect(TweetBuilder::REPRESENTATIVE_PLACEHOLDER).to eq("@YourRepresentativeHere")
    end
  end

  describe "#build" do
    let!(:user) { FactoryGirl.create(:user, state: state, district: district) }
    let!(:tweet_text) { "Tweet Text" }
    let!(:builder) { TweetBuilder.new(user, tweet_text) }
    let(:tweet_for_rep) { "#{tweet_text} #{rep_handle}" }
    let(:tweet_for_senator) { "#{tweet_text} #{senator_handle}" }
    let(:tweet_for_all) { "#{tweet_text} #{senator_handle} #{rep_handle}" }
    
    describe "when user is missing congress members"  do
      it "builds a tweet without mentions" do
        expect(builder.build_for(:senator)).to eq(tweet_text)
        expect(builder.build_for(:representative)).to eq(tweet_text)
        expect(builder.build_for(:all)).to eq(tweet_text)
      end
    end

    describe "when user is missing its representative"  do
      let!(:senator) { FactoryGirl.create(:senator, state: state, twitter_handle: senator_handle) }
      it "builds a tweet for his/her representative or without mentions" do
        expect(builder.build_for(:senator)).to eq(tweet_for_senator)
        expect(builder.build_for(:representative)).to eq(tweet_text)
        expect(builder.build_for(:all)).to eq(tweet_for_senator)
      end
    end

    describe "when user is missing its senator"  do
      let!(:rep) { FactoryGirl.create(:representative, state: state, district: district, twitter_handle: rep_handle) }
      it "builds a tweet with the users' choice of senator and/or representative" do
        expect(builder.build_for(:senator)).to eq(tweet_text)
        expect(builder.build_for(:representative)).to eq(tweet_for_rep)
        expect(builder.build_for(:all)).to eq(tweet_for_rep)
      end
    end

    describe "when user has congress members"  do
      let!(:rep) { FactoryGirl.create(:representative, state: state, district: district, twitter_handle: rep_handle) }
      let!(:senator) { FactoryGirl.create(:senator, state: state, twitter_handle: senator_handle) }
      it "builds a tweet with the users' choice of senator and/or representative" do
        expect(builder.build_for(:senator)).to eq(tweet_for_senator)
        expect(builder.build_for(:representative)).to eq(tweet_for_rep)
        expect(builder.build_for(:all)).to eq(tweet_for_all)
      end
    end

  end
end