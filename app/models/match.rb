class Match < ActiveRecord::Base
  validates :game_id, presence: true
  validates :venue, presence: true
  belongs_to :game
  belongs_to :tournament
  #has_and_belongs_to_many :players
  has_many :scores, dependent: :destroy
  has_many :players, through: :scores
  accepts_nested_attributes_for :players


  def winner
    player = scores.order(points: :desc).first
    if(player && player.points != 0 && player.points != nil)
      winner = Player.find(player.player_id).name
      p winner
    else 
      return nil
    end

  end

end
