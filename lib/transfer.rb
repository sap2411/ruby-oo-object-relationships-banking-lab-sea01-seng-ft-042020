require "pry"
class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status != "complete" && @sender.balance >= @amount && self.valid?
      # binding.pry
      @receiver.deposit(@amount)
      @sender.deposit(-@amount)
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && @sender.balance >= @amount && self.valid?
      # binding.pry
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end