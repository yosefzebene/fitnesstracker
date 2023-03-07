class Workout < ApplicationRecord
    has_many :userworkouts
    has_many :progresses
end
