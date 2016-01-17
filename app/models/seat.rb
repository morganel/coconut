class Seat < ActiveRecord::Base
  #include ActiveModel::Validations

  belongs_to :flight
  
  validate do
    if baggage > flight.baggage_allowance
      errors.add(:base,"too much luggage")
    end
    if flight.seats.size >= flight.capacity
      errors.add(:base, "flight is full")
    end
  end
end
