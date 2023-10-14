play_game <- function() {
  computer_score <- 0
  user_score <- 0
  
  while (TRUE) {
    computer_choice <- sample(c("rock", "paper", "scissors"), 1)
    cat("What is your choice? (rock, paper, scissors): ")
    user_choice <- readLines("stdin",n=1)
  
    if (user_choice == computer_choice) {
      print("Tie!")
    } else if (user_choice == "rock" && computer_choice == "scissors") {
      user_score <- user_score + 1
      print("You win!")
    } else if (user_choice == "paper" && computer_choice == "rock") {
      user_score <- user_score + 1
      print("You win!")
    } else if (user_choice == "scissors" && computer_choice == "paper") {
      user_score <- user_score + 1
      print("You win!")
    } else {
      computer_score <- computer_score + 1
      print("Computer wins!")
    }
  
    print(paste("Computer score:", computer_score, "Player score:", user_score))
  
    cat("Do you want to continue? (Y/N): ")
    user_status <- readLines("stdin",n=1)
  
    if (toupper(user_status) == "N") {
      print(paste("Final score -> Computer score:", computer_score, "Player score:", user_score))
      break
    }
  }
}

play_game()
