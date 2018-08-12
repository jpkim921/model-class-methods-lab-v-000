class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    # returns the first five Boats
    # boats = Boat.all.map {|boat| boat.name if boat.id <= 5}.compact
    # binding.pry
    Boat.all.limit(5)
  end

  def self.dinghy
    # Boat.all.map {|boat| boat.name if boat.length < 20}.compact
    Boat.all.where(:length < 20)
  end

  def self.ship
    Boat.all.select {|boat| boat.name if boat.length >= 20}.compact
  end

end
