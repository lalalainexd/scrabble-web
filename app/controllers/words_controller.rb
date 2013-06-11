class WordsController < ApplicationController
  def index
    @new_word = Word.new
    @last_word = Word.last
    @previous_words = []
  end

  def create
    word = Word.create_with_score(params[:word])
    if word.invalid?
      flash[:notice] = "Sorry, please enter a single word made up of only letters"
    end
    redirect_to words_path
  end
end
