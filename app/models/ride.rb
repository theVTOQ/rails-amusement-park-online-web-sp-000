class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user_tickets < tickets_needed && user_height < height_needed
      "Sorry. You do not have enough tickets to ride the #{attraction_name}. You are not tall enough to ride the #{attraction_name}."
    elsif user_tickets < tickets_needed
      "Sorry. You do not have enough tickets to ride the #{attraction_name}."
    elsif user_height < height_needed
      "Sorry. You are not tall enough to ride the #{attraction_name}."
    else
      #binding.pry
      #user_tickets = user_tickets - tickets_needed
      #self.user.tickets = self.user.tickets - tickets_needed
      #self.user.deduct_tickets(self.attraction.tickets)
      deduct_tickets_from_user
      #user_happiness = user_happiness + attraction_happiness_rating
      #self.user.happiness = self.user.happiness + self.attraction.happiness_rating
      #self.user.increase_happiness(self.attraction.happiness_rating)
      increase_happiness_of_user
      #user_nausea = user_nausea + attraction_nausea_rating
      #self.user.nausea = self.user.nausea + self.attraction.nausea_rating
      #self.user.increase_nausea(self.attraction.nausea_rating)
      increase_nausea_of_user

      self.user.save
    end
  end

  def deduct_tickets_from_user
    self.user.deduct_tickets(tickets_needed)
  end

  def increase_happiness_of_user
    self.user.increase_happiness(attraction_happiness_rating)
  end

  def increase_nausea_of_user
    self.user.increase_nausea(attraction_nausea_rating)
  end

  #Getters
  def attraction_name
    self.attraction.name
  end

  def attraction_nausea_rating
    self.attraction.nausea_rating
  end

  def attraction_happiness_rating
    self.attraction.happiness_rating
  end

  def user_height
    self.user.height
  end

  def height_needed
    self.attraction.min_height
  end

  def user_tickets
    self.user.tickets
  end

  def tickets_needed
    self.attraction.tickets
  end

  #Setters
  def user_tickets=(new_amt)
    self.user.tickets = new_amt
  end

  def user_happiness=(new_amt)
    self.user.happiness = new_amt
  end

  def user_nausea=(new_amt)
    self.user.nausea = new_amt
  end
end
