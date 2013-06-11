require 'spec_helper'

describe Word do
  describe 'validations' do
    xit "is valid with a word" do
      expect(Word.new(:word => "hi")).to be_valid
    end

    xit "is not valid without a word" do
      expect(Word.new).to_not be_valid
    end

    it "does not allow non-letters in words"
  end

  describe 'create_with_score' do
    it "creates a word with a score" do

      Word.stub(:compute_score).with('hello').and_return(8)
      word = Word.create_with_score(word: "hello")
      expect(word.score).to eq(8)

    end
  end

  describe '.compute_score' do
    it "scores hello as 8" do
      expect(Word.compute_score("hello")).to eq(8)
    end
  end
end
