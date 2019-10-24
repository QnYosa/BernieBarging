class Dog < ApplicationRecord
    has_many :strolls, through: :entity
end
