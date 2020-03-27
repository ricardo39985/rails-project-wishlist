# frozen_string_literal: true

class Dealership < ApplicationRecord
  has_and_belongs_to_many :cars
  has_many :users, through: :cars
  has_many :manufacturers, through: :cars
  validates :name, presence: true
  validates :location, presence: true
  scope :filter_by,
        lambda { |make|
          joins(:users).where(users: { id: User.last.id.to_s })
                       .includes('cars').joins(:manufacturers).where(manufacturers: { name: make.to_s })
        }
end
