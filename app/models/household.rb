class Household < ApplicationRecord
  has_many :expenses
  has_and_belongs_to_many :users
  has_many :household_categories
  has_many :categories, through: :household_categories

  validates_presence_of :name

  accepts_nested_attributes_for :expenses



end
