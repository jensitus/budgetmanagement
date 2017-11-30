class HouseholdCategory < ApplicationRecord
  belongs_to :household
  belongs_to :category
end
