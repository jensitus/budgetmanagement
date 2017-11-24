class Household < ApplicationRecord
  has_many :expenses
  has_and_belongs_to_many :users

  validates_presence_of :name

  accepts_nested_attributes_for :expenses



end
