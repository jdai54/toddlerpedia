module RandomData
  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end

    sentences.join(" ")
  end

  def self.random_sentence
    strings = []
    rand(3..8).times do
      word = Faker::Pokemon.location
      strings << word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "."
  end
end
