class Account

  attr_reader :name
  attr_reader :balance

  def initialize(name, balance = 100)
    @name = name
    @balance = balance
    puts "To create an account, enter a 4 digit password: "
    @pin = get_pin
  end

  public
  def display_balance
    print "Enter password to see the balance: "
    puts get_pin == pin ? "Balance: $#{balance}": pin_error
  end
  
  def withdraw(amount)
    print "Enter password to withdraw: "
    if get_pin == pin
      while amount > @balance do
        puts "Not enough funds. Enter a valid amount: "
        amount = gets.chomp.to_i
      end
      @balance -= amount
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  def deposit(amount)
    puts "Enter your password to make the deposit: "
    if get_pin == pin
      @balance += amount
      puts "Deposit #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end
    
  private
  def pin
    @pin
  end

  def get_pin
    print "\n---> "
    gets.chomp.to_i
  end
  
  def pin_error
    "Access denied: incorrect PIN."
  end
end

checking_account = Account.new('Gustavo', 1_000_000)
checking_account.display_balance
checking_account.withdraw(2_000_000)
checking_account.deposit(330000)

