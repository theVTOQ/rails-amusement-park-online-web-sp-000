class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates_inclusion_of :admin, in: [true, false]

  before_validation :default_values

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
    self.tickets ||= 0
    self.nausea ||= 0
    self.happiness ||= 0
  end
end
