require_relative "croupier"

puts "*** WELCOME TO OUR FANCY BLACKJACK ***"

# Pick the bank score and store it in a variable
bank_score = pick_bank_score
# Initialize the player score at 0
player_score = 0
running = true

while running
  # Ask the player for a card
  puts "Card? 'y' or 'yes' to get a new card (Else game over)"
  # Get the player's answer and store it in a variable
  player_answer = gets.chomp.downcase
  # If the answer is 'y' or 'yes':
  if %w[y yes].include?(player_answer)
    # Pick a player card and add it to the player score
    player_score += pick_player_card
    # Display the state of the game
    puts state_of_the_game(player_score, bank_score)
    running = player_score < 21
  else
    running = false
  end
  # Go back to ask the player for a card
end
# Print the end of the game message
puts end_game_message(player_score, bank_score)
