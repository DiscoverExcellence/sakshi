class Game < ActiveRecord::Base
  attr_accessor :matches_attributes
  validates :name,:scoring_pts, presence: true
  validates :scoring_pts, numericality: true
  validates :name, uniqueness: true 
  has_many :matches, dependent: :destroy
  has_many :tournaments, dependent: :destroy
 # accepts_nested_attributes_for :matches
end

