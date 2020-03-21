class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  before_save :default_values

  def mood
    self.nausea > self.happiness ? 'sad' : 'happy'
  end

  def deduct_tickets(ticket_amt)
    self.tickets = self.tickets - ticket_amt
    #binding.pry
  end

  def increase_nausea(nausea_amt)
    self.nausea += nausea_amt
  end

  def increase_happiness(happiness_amt)
    self.happiness += happiness_amt
  end

  private

  def default_values
    self.admin ||= false
  end
end
