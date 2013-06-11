class Word < ActiveRecord::Base
  attr_accessible :word, :score
  validates :word, format: {with: /\A[a-zA-Z]+\z/}
  def self.letter_scores
    {"A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
     "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
     "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10}
  end

  def self.create_with_score(value)
    score = Word.compute_score(value[:word])
    word = Word.create(word: value[:word], score: score)

  end

  def self.compute_score(word)
    word.upcase.chars.inject(0){|sum, char| sum + letter_scores[char]}
  end
end
