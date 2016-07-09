class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_accessor :guesses, :wrong_guesses, :word
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
  def guess c
    raise ArgumentError, 'Argument is not a letter' if c =~ /^[^a-z]$/i or c.nil? or c.empty?
    c.downcase!
    if !@guesses.include? c and !@wrong_guesses.include? c
      return (@word.downcase.include? c) ? @guesses << c : @wrong_guesses << c
    end
    return false
  end
  
  def guess_several_letters cs
    cs.each { |c| guess c}
  end
  
  def word_with_guesses
    guessed_word = ''
    @word.each_char { |c| (@guesses.include? c) ? guessed_word << c : guessed_word << '-' }
    guessed_word
  end
  
  def check_win_or_lose
    word_with_guesses == word ? :win : (wrong_guesses.length >= 7 ? :lose : :play)
  end
    
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
