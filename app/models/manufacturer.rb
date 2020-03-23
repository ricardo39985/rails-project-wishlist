# frozen_string_literal: true

class Manufacturer < ApplicationRecord
  has_many :cars
  has_many :users, through: :cars
  has_many :dealerships, through: :cars
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
end
