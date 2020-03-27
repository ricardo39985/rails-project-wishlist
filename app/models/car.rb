# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :user
  belongs_to :manufacturer
  has_and_belongs_to_many :dealerships
  validates :model, presence: :true
  scope :toyota,
        -> { joins(:manufacturer).where(manufacturers: { 'name' => 'Toyota' }) }
  scope :honda,
        -> { joins(:manufacturer).where(manufacturers: { 'name' => 'Honda' }) }
  
  # Ex:- scope :active, ->
  # def filter_by(input)
  #   joins(:dealership).where(: {'name' => "#{input}"})
  #   # where("created_at < ?", time) 
  # end
end
