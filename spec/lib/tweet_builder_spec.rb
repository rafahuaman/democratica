require 'spec_helper'

describe "TweetBuilder" do
  let(:state) { "MM" }
  let(:district) { 1 }
  let(:rep_handle) { "@rep" }
  let(:first_senator_handle) { "@senator" }
  let(:second_senator_handle) { "@senator2" }

  describe "constants" do
    it "has placeholder constants" do 
      expect(TweetBuilder::SENATOR_PLACEHOLDER).to eq("@YourSenatorsHere")
      expect(TweetBuilder::REPRESENTATIVE_PLACEHOLDER).to eq("@YourRepresentativeHere")
    end
  end

  describe "#build" do
    let!(:user) { FactoryGirl.create(:user, state: state, district: district) }
    let!(:tweet_text) { "Tweet Text" }
    let!(:builder) { TweetBuilder.new(user, tweet_text) }
    let(:tweet_for_rep) { "#{tweet_text} #{rep_handle}" }
    let(:tweet_for_senators) { "#{tweet_text} #{first_senator_handle} #{second_senator_handle}" }
    let(:tweet_for_all) { "#{tweet_text} #{first_senator_handle} #{second_senator_handle} #{rep_handle}" }
    
    describe "when user is missing congress members"  do
      it "builds a tweet without mentions" do
        expect(builder.build_for(:senator)).to eq(tweet_text)
        expect(builder.build_for(:representative)).to eq(tweet_text)
        expect(builder.build_for(:all)).to eq(tweet_text)
      end
    end

    describe "when user is missing its representative"  do
      let!(:first_senator) { FactoryGirl.create(:senator, state: state, twitter_handle: first_senator_handle) }
      let!(:second_senator) { FactoryGirl.create(:senator, state: state, twitter_handle: second_senator_handle) }

      it "builds a tweet for his/her representative or without mentions" do
        expect(builder.build_for(:senators)).to eq(tweet_for_senators)
        expect(builder.build_for(:representative)).to eq(tweet_text)
        expect(builder.build_for(:all)).to eq(tweet_for_senators)
      end
    end

    describe "when user is missing its senators"  do
      let!(:rep) { FactoryGirl.create(:representative, state: state, district: district, twitter_handle: rep_handle) }
      it "builds a tweet with the users' choice of senator and/or representative" do
        expect(builder.build_for(:senators)).to eq(tweet_text)
        expect(builder.build_for(:representative)).to eq(tweet_for_rep)
        expect(builder.build_for(:all)).to eq(tweet_for_rep)
      end
    end

    describe "when user is missing one senator"  do
      let!(:first_senator) { FactoryGirl.create(:senator, state: state, twitter_handle: first_senator_handle) }
      let!(:rep) { FactoryGirl.create(:representative, state: state, district: district, twitter_handle: rep_handle) }
      let(:tweet_for_single_senator) { "#{tweet_text} #{first_senator_handle}" }
      let(:tweet_for_rep_and_1_senator) { "#{tweet_text} #{first_senator_handle} #{rep_handle}" }

      it "builds a tweet with the users' choice of senator and/or representative" do
        expect(builder.build_for(:senators)).to eq(tweet_for_single_senator)
        expect(builder.build_for(:representative)).to eq(tweet_for_rep)
        expect(builder.build_for(:all)).to eq(tweet_for_rep_and_1_senator)
      end
    end

    describe "when user has congress members"  do
      let!(:rep) { FactoryGirl.create(:representative, state: state, district: district, twitter_handle: rep_handle) }
      let!(:first_senator) { FactoryGirl.create(:senator, state: state, twitter_handle: first_senator_handle) }
      let!(:second_senator) { FactoryGirl.create(:senator, state: state, twitter_handle: second_senator_handle) }

      it "builds a tweet with the users' choice of senators and/or representative" do
        expect(builder.build_for(:senators)).to eq(tweet_for_senators)
        expect(builder.build_for(:representative)).to eq(tweet_for_rep)
        expect(builder.build_for(:all)).to eq(tweet_for_all)
      end
    end

  end
end