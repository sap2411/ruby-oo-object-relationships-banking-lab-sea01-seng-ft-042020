class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        self.save
    end

    def save
        @@all << self
    end

    def deposit(amount)
        @balance = @balance + amount
    end

    def display_balance
        "Your balance is $#{1000}."
    end

    def valid?
        self.status == "open" && self.balance > 0 ? true : false
    end

    def close_account
        @status = "closed"
    end
end
