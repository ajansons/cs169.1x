class Movie < ActiveRecord::Base
     def self.get_ratings
          select(:rating).map(&:rating).uniq
     end
end
