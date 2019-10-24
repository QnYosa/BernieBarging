class Stroll < ApplicationRecord
    has_many :dogs, through: :entity
    belongs_to :dogsitter
end
