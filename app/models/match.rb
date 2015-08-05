class Match < ActiveRecord::Base
  validates :game_id, presence: true
  belongs_to :game
  belongs_to :tournament
  #has_and_belongs_to_many :players
  has_many :scores
  has_many :players, through: :scores
  accepts_nested_attributes_for :players


  def winner
    scores.order(points: :desc).first.name
  end

end
