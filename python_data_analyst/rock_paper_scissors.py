import random

#all possible choices
choices = ["rock", "paper", "scissor"]

# point collectors
player_score = 0
computer_score = 0

#game status
playing_status = True

#previous choice
player_choice_hist = []
computer_choice_hist = []

while playing_status:
  #insert player choice and random computer choice
  player_choice = input("what's your choice (rock/paper/scissor): ")
  computer_choice = random.choice(choices)

  player_choice_hist.append(player_choice)
  computer_choice_hist.append(computer_choice)

  print(f"Your choice = {player_choice} vs Computer choice = {computer_choice}")

  #compare player and computer choice
  if player_choice not in choices:
    print("check your spelling")
    pass
  elif player_choice == "rock" and computer_choice == "scissor":
    print("You win!")
    player_score += 1
  elif player_choice == "paper" and computer_choice == "rock":
    print("You win!")
    player_score  += 1
  elif player_choice == "scissor" and computer_choice == "paper":
    print("You win!")
    player_score  += 1
  else:
    print("You lose")
    computer_score += 1

  #show current score
  print(f"Your score {player_score} : Computer score {computer_score}")

  #ask player for continuing the game
  cont = input("Do you want to continue? (y/n) :")
  if cont == 'y':
    pass
  elif cont == "n":
    if player_score > computer_score:
      print("You win this game congrat!")
    elif player_score == computer_score:
      print("This game is draw")
    else:
      print("You lose this game try again next time T_T")
    playing_status = False
  else:
    print("check your typing! we will continue the game")

