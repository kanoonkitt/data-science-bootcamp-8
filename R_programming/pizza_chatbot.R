chatbot <- function(){
order <- list()
pizza <- list(
  pizza_types = c("hawaiian"=100, "pepperoni"=100, "mushroom"=100, "sausage"=150),
  size = c("small" = 200, "medium" = 250, "large" = 300, "extra-large" = 400),
  edge = c("normal"= 0, "cheese" = 20, "sausage" = 20),
  extra_toppings = c("no" = 0, "sausage" = 10, "meatball" = 10, "cheese" = 10)
)

cat("Hi! Welcome to Pizza Chatbot\n")

cat("1. Select pizza type (Hawaiian, Pepperoni, Mushroom, Sausage): ")
customer_type <- tolower(readLines("stdin",n=1))
while (!(customer_type %in% names(pizza$pizza_types))) {
  customer_type <- tolower(readline("Invalid pizza type. Please check your spelling and try again: "))
}
order <- append(order, pizza$pizza_types[[customer_type]])

cat("2. Select pizza size (small, medium, large, extra-large): ")
customer_size <- tolower(readLines("stdin",n=1))
while (!(customer_size %in% names(pizza$size))) {
  customer_size <- tolower(readline("Invalid size. Please check your spelling and try again: "))
}
order <- append(order, pizza$size[[customer_size]])

cat("3. Select pizza edge (normal, cheese, sausage): ")
customer_edge <- tolower(readLines("stdin",n=1))
while (!(customer_edge %in% names(pizza$edge))) {
  customer_edge <- tolower(readline("Invalid edge. Please check your spelling and try again: "))
}
order <- append(order, pizza$edge[[customer_edge]])

cat("4. Select 1 extra pizza topping (no, sausage, meatball, cheese): ")
customer_topping <- tolower(readLines("stdin",n=1))
while (!(customer_topping %in% names(pizza$extra_toppings))) {
  customer_topping <- tolower(readline("Invalid topping. Please check your spelling and try again: "))
}
order <- append(order, pizza$extra_toppings[[customer_topping]])

total_amount <- sum(unlist(order))
cat("Your order is", customer_size, customer_type, "with", customer_edge, "edge and", customer_topping, "extra added\n")
cat("Total amount is", total_amount, "Baht\n")
}
chatbot()
