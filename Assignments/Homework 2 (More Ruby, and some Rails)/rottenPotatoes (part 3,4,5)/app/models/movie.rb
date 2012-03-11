class Movie < ActiveRecord::Base
  def self.getRatings  
    select("DISTINCT rating").map(&:rating)
  end
end
