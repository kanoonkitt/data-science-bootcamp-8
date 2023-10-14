class Atm():
  def __init__(self,acc_num,balance,pin):
    self.acc_num = acc_num
    self.balance = balance
    self.pin = pin

  def check_balance(self):
    print(f"Your balance is {self.balance} baht")

  def deposit(self, amount):
    self.balance += amount
    self.check_balance()

  def withdraw(self, amount):
    self.balance -= amount
    if self.balance < 0:
      self.balance += amount
      print("Not enought money in the account")
      self.check_balance()
    else:
      self.check_balance()

  def change_pin(self, old_pin, new_pin):
        if self.pin != old_pin:
          print("Wrong pin! please try again")
        else:
          self.pin = new_pin
          print("your pin already changed")

  def transfer(self, receiver_num, amount):
    self.balance -= amount
    if self.balance < 0:
      self.balance += amount
      print("ERROR! not enought money in the account. Please try again")
      self.check_balance()
    else:
      print(f"Transferred {amount} baht to {receiver_num}. Your balance is {self.balance} baht.")
