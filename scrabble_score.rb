class ScrabbleScore
  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word.to_s
  end

  def score
    @word.upcase.chars.sum { |char| letter_score[char] }
  end

  private

  def letter_score
    @letter_score ||= begin
      score_card = Hash.new 0
      score_card.merge({
                         %w|A E I O U L N R S T| => 1,
                         %w|D G| => 2,
                         %w|B C M P | => 3,
                         %w|F H V W Y| => 4,
                         %w|K| => 5,
                         %w|J X| => 8,
                         %w|Q Z| => 10
                       }.each_with_object({}) do |(letters, score), letter_to_score|
        letters.each { |letter| letter_to_score[letter] = score }
      end
      )
    end
  end
end
