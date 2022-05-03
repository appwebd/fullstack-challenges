require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  "Your score is #{player_score}, bank is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  if player_score == 21
    message = "Black Jack!"
  else
    message = "You are over 21... you lose!"
    if player_score < 21
      message = "The bank beats you! You lose!"
      if player_score == bank_score
        message = "Push!"
      elsif player_score > bank_score
        message = "You beat the bank! You win!"
      end
    end
  end
  message
end
