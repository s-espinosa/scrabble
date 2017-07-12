class Scrabble

  def score(word)
    return 0 if word.nil?
    multipliers = Array.new(word.length, 1)
    score_with_multipliers(word, multipliers)
  end

  def score_with_multipliers(word, multipliers, word_multiplier = 1)
    return 0 if word.nil?
    letters = word.upcase.split("")
    base_score = calculate_base_score(letters, multipliers)
    base_score = base_score + 10 if word.length >= 7
    base_score * word_multiplier
  end

  def calculate_base_score(letters, multipliers)
    letters.map.with_index do |letter, index|
      point_values[letter] * multipliers[index]
    end.sum
  end

  def score_letters(letters)
    letters.map do |letter|
      score_letter(letter)
    end.sum
  end

  def score_letter(letter)
    point_values[letter]
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
