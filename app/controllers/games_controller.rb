class GamesController < ApplicationController
  require "json"
  require "open-uri"

  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    @answer = params["answer"]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}/"
    user_serialized = URI.open(url).read
    english_word = JSON.parse(user_serialized)
    @is_english_word = english_word["found"]
    @letters = params["letters"].split
    @is_included = @answer.chars.all? do |letter|
      @answer.count(letter) <= @letters.count(letter)
    end
  end

  # def score
  #  @answer = params[:answer]
  #  if @letters ==
  # end

end
